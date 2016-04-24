[TOC]

##通讯方式

The micro Object Request Broker (uORB) application is used to share data structures between threads and applications.

Communications between processes / applications (e.g. sending sensor values from the sensors app to the attitude filter app) is a key part of the PX4 software architecture. Processes (often called nodes in this context) exchange messages over *named buses*, called **topics**(topics也可以叫做bus). 

To make this efficient, there is always *onlyone message on the bus and no queue is kept*.(一个topic里面只包含一中信息，并且不设置排队机制)

启动：

在任何应用开启前：**uorb start**

##代码解析

###uORB定义
目前uORB命名空间中只有一个类型，继承自其他类  *uORBManager.hpp: 50-60*
```
namespace uORB

{
class Manager;
}



class uORB::Manager  : public uORBCommunicator::IChannelRxHandler

```



###程序解析

####ORB_DECLARE(topicName)

宏函数    *uORB.h: 94-100*    只对topicName进行定义，相当于定义了一个全局的orb_metadata __orb_topicName

```

# define ORB_DECLARE(_name)	 extern "C" const struct orb_metadata __orb_##_name __EXPORT

```

**orb_metadata**    topic 目标元数据（用来描述数据的数据，包含两个信息：数据名称和数据长度）确保数据在更新和拷贝时候的正确性，包含了目标名称和长度两个信息  *uORB.h: 52-55*

```

struct orb_metadata {

    const char *o_name;	 /**< unique object name */

    const size_t o_size;	 /**< object size */

};

```



####ORB_DEFINE(topicName)

宏函数    *uORB.h:114-120*     对之前申明的__orb_topicName进行初始化

```

#define ORB_DEFINE(_name, _struct)	 \

const struct orb_metadata __orb_##_name = {	\

#_name,	 \     /*# 变量字符串化操作*/

sizeof(_struct)	 \

}; struct hack



__BEGIN_DECLS

```

####ORB_ID(topicName)

宏函数  *uorb.h: 87*    用于得到该topic元数据meta的地址

```

#define ORB_ID(_name)	 &__orb_##_name 

```





####<span id = "ioctl重载函数">int uORB::DeviceNode::ioctl(...)和uorb_...各个函数的关系及实现</span>

位置*uORBDevices_nuttx.cpp: 263-292*

```

int uORB::DeviceNode::ioctl(struct file *filp, int cmd, unsigned long arg)

{

    ﻿SubscriberData *sd = filp_to_sd(filp);



    ﻿	switch (cmd) {

    ﻿    ﻿	case ORBIOCLASTUPDATE:/*被orb_start调用 -bdai<2016-04-23>*/

    ﻿    ﻿	 *(hrt_abstime *)arg = _last_update;/*将目标上次的时间返回给arg指向的变量 -bdai<2016-04-23>*/

    ﻿    ﻿	 return OK;



    ﻿    ﻿	case ORBIOCUPDATED:/*被orb_check调用, -bdai<2016-04-23>*/

    ﻿    ﻿	 *(bool *)arg = appears_updated(sd);/*用于判断当前线程(subscribe调用的位置)中的数据是否更新，通过对比当前的sd中的generation和publish的topic的generation的值-bdai<2016-04-23>*/

    ﻿    ﻿	 return OK;

    ﻿    ﻿

    ﻿    ﻿	case ORBIOCSETINTERVAL:/*被orb_set_interval调用 -bdai<2016-04-23>*/

    ﻿    ﻿	 sd->update_interval = arg;/*将update_interval赋值为arg(微秒级别) -bdai<2016-04-23>*/

    ﻿    ﻿	 return OK;



    ﻿    ﻿	case ORBIOCGADVERTISER:/*被orb_advertise[_multi]调用 -bdai<2016-04-23>*/

    ﻿    ﻿	 *(uintptr_t *)arg = (uintptr_t)this;/*将当前创建的DeviceNode地址返回给arg参数 -bdai<2016-04-23>*/

    ﻿    ﻿	 return OK;



    ﻿    ﻿	case ORBIOCGPRIORITY:/*被orb_prriority调用 -bdai<2016-04-23>*/

    ﻿    ﻿	 *(int *)arg = sd->priority;/*用于获得当前subcriberdata的priority属性 -bdai<2016-04-23>*/

    ﻿    ﻿	 return OK;



    ﻿    ﻿	default:

    ﻿    ﻿	 /* give it to the superclass */

    ﻿    ﻿	 return CDev::ioctl(filp, cmd, arg);

    ﻿  }

}

```



#### orb_advert_t orb_advertise(const struct orb_metadata \*meta, const void \*data)

位置：*uORB.cpp: 65*

功能：在*/obj*中创建一个*topic*的节点，主要就是告诉大家此处为publisher，并且调用了orb_publish(...)进行第一次的publish，返回值是一个指向该*topic*的handle。任何advertiser都可以对一个topic进行publish，也就是说对于同一个topic可以在不同处对其进行pulish。

**分析：**

**1. **首先通过`uORB::Manager::get_instance()->...`获得一个instance，所有线程只有一个instance，在第一次调用的时候创建，相当于是一个方法的集合，而instance是一个入口。位置：*uORBManager_nuttx.cpp: 49-56*

```

uORB::Manager *uORB::Manager::get_instance()

{

    if (_Instance == nullptr) {

        _Instance = new uORB::Manager();/*所有程序中应该只有一个_Instance，相当于包含了很多方法的一个入口 -bdai<2016-04-23>*/

        }



    ﻿return _Instance;

}

```



**2.**调用 `uORB::Manager::get_instance()->orb_advertise_multi(meta, data, nullptr, ORB_PRIO_DEFAULT)`，返回一个指向meta所描述的topic的句柄

位置*uORBManager_nuttx.cpp: 89-123*

```

/**fun: 返回一个指向meta所描述的topic的句柄

 * parame: meta:用于描述topic的元数据， data：初始数据

 * return: advertiser:指向meta描述的topic的句柄

 * reader: daibo<bdai1412@gmail.com>  2016-04-23 22:13

 */

uORB::Manager::get_instance()->orb_advertise_multi(meta, data, nullptr, ORB_PRIO_DEFAULT)

{

    int result, fd; 

    orb_advert_t advertiser;



    /* open the node as an advertiser */

    fd = node_open(PUBSUB, meta, data, true, instance, priority);

    ...

    result = ioctl(fd, ORBIOCGADVERTISER, (unsigned long)&advertiser); /*通过不同的指令实现不同的函数*/

    ...

    result = orb_publish(meta, advertiser, data);

    ...

    return advertiser;

}

```

这一函数中又有两个函数用到，因此第二步可以分为两步：

**2.1**调用node_open(PUBSUB, meta, data, true, instance, priority)，返回该topic的新的node的fd

位置：uORBManaer_nuttx.cpp:222-303

过程：先获得该topic的路径*path*，再通过该路径得到该topic的`fd(file descriptor)`，通过该fd判断该topic的note是否存在，如果存并且此时是advertiser，则关闭该fd并创建新的Note指向该topic，最后返回新的fd。

```

int uORB::Manager::node_open(Flavor f,const struct orb_metadata *meta,const void *data,bool advertiser,int *instance,int priority)

{

    ...



    ret = uORB::Utils::node_mkpath(path, f, meta, instance);/*将mate->o_name字符串赋给path指针 -bdai<2016-04-23>*/

    ...

    /* open the path as either the advertiser or the subscriber */

    fd = open(path, (advertiser) ? O_WRONLY : O_RDONLY);    

    

    /*如果note存在，并且此时需要advertise这个topic -bdai<2016-04-23>*/

    if ((fd >= 0) && (instance != nullptr) && (advertiser)) {

    	/* close the fd, we want a new one */

    	close(fd);

    	/* the node_advertise call will automatically go for the next free entry */

   	 fd = -1;

    	}

    /*创建新的DeviceNode -bdai<2016-04-23>*/

    if (fd < 0) {

    	/* try to create the node */

    ret = node_advertise(meta, instance, priority);

    if (ret == OK){

    ret = uORB::Utils::node_mkpath(path, f, meta, instance);/*获得meta的新的路径 -bdai<2016-04-23>*/

    ...

    }

    ...

    fd = open(path, (advertiser) ? O_WRONLY : O_RDONLY);

    }

...

}

```

**2.2**通过ioctl(fd, ORBIOCGADVERTISER, (unsigned long)&advertiser)获得fd所描述的topic的句柄，并将该句柄赋给advertiser。该过程又可以分为两步：

2.2.1首先进入int ioctl(int fd, int req, unsigned long arg)

位置：*fs_ioctl.c: 87-149*

过程：首先跳转到int ioctl(int fd, int req, unsigned long arg)函数，该函数一共有三个参数，分别是文件描述fd， ioctl指令，和cmd参数 arg。**在该函数中首先对fd进行了解析，得到fd所描述的文件，然后通过该文件的得到其node节点**，最后通过函数重载和一个选择列表实现不同的req对应的功能。

```

int ioctl(int fd, int req, unsigned long arg)

{

    ...

    this_file = &list->fl_files[fd];/*通过fd得到该文件 -bdai<2016-04-23>*/

    inode     = this_file->f_inode;/*得到该文件后，可以得到该文件的node节点 -bdai<2016-04-23>*/

    ...

    ret = (int)inode->u.i_ops->ioctl(this_file, req, arg);/*通过函数重载，对于不同的req具有不同的功能 -bdai<2016-04-23>*/    

    ...

```

2.2.2通过函数的重载得到在ioctl的具体实现：[int uORB::DeviceNode::ioctl(struct file *filp, int cmd, unsigned long arg)](#ioctl重载函数)
不同的cmd，对应于不同的指令，分别对应于orb_start, orb_check等。

位置：uORBDevices_nuttx.cpp: 262-292





####orb_publish(meta, handle, data)

位置：uORB.cpp: 155

形式：int  orb_publish(const struct orb_metadata \*meta, orb_advert_t handle, const void \*data)

功能：将新的数据publish到topic中，即将data的数据放到handle所指向的topic中，返回值为ERROR或者OK

**分析：**

第一个参数mete适用于来校对数据，防止出现错误。

```

位置：uORBDevices_nuttx.cpp: 294-337

uORB::DeviceNode::publish(...)

{

    ...

    uORB::DeviceNode *DeviceNode = (uORB::DeviceNode *)handle;/*获得topic的指针，此时DeviceNode包含了该信息 -bdai<2016-04-24>*/

    ...

    ret = DeviceNode->write(nullptr, (const char *)data, meta->o_size);/*更新topic的数据 -bdai<2016-04-24>*/

    ...

    send_message(meta->o_name, meta->o_size, (uint8_t *)data) != 0) /*if the write is successful, send the data over the Multi-ORB link*/

    ...

}

```

**分析DeviceNode->write函数**位置：uORBDevices_nuttx.cpp: 210-260

```

ssize_t uORB::DeviceNode::write(struct file *filp, const char *buffer, size_t buflen)

{

    ...

    memcpy(_data, buffer, _meta->o_size);/*将buffer的数据拷贝到DeviceNode节点的_data属性中 -bdai<2016-04-24>*/

    ...

    

    /* update the timestamp and generation count */

    	_last_update = hrt_absolute_time();

    	generation++;/*该属性用于和不同线程的subscribe中的sd(subscribedata)generaion进行对比，从而确定订阅了该topic的数据有没有更新，即orb_chech -bdai<2016-04-24>*/

    ...

}

```



####orb_subscribe(meta)

位置：uORB.cpp: 186

形式：int  orb_subscribe(const struct orb_metadata \*meta)

功能：返回meta中包含的topic所在位置的hanle

**分析：**



####orb_check(handle, update)

位置：uORB.cpp: 275

形式：int  orb_check(int handle, bool \*updated)

功能：检查某个handle指向的topic自从上一次orb_copy之后是否更新



####orb_copy(meta, handls, buffer)

位置：uORB.cpp: 252

形式：int  orb_copy(const struct orb_metadata *meta, int handle, void *buffer)

功能：从handle指向的topic中获得数据到buffer中



##快速开始

topic.h

```

/* declare the topic */

 ORB_DECLARE(random_integer);/* define the data structure that will be published where subscribers can see it */

 struct random_integer_data {/*新版本叫struct randow_integer_s以s结尾*/

    int r; 

};

```

publisher.c

```



#include <topic.h>

 

/* create topic metadata */

ORB_DEFINE(random_integer); /*新版本有两个参数 ORB_DEFINE(random_integer, random_integer_s)*/

 

/* file handle that will be used for publishing */

static int topic_handle;

 

int init() {

/* generate the initial data for first publication */

struct random_integer_data rd = { .r = random(), };

 

/* advertise the topic and make the initial publication */

topic_handle = orb_advertise(ORB_ID(random_integer), &rd);

}



int update_topic() {

/* generate a new random number for publication */

struct random_integer_data rd = { .r = random(), };

/* publish the new data structure */

orb_publish(ORB_ID(random_integer), topic_handle, &rd);

}

```



