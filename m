Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A86C9E829E
	for <lists.iommu@lfdr.de>; Tue, 29 Oct 2019 08:42:42 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 40BA8E85;
	Tue, 29 Oct 2019 07:42:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E9A6AAF3
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 06:40:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 95FF2FD
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 06:40:47 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 15so8827204pgt.7
	for <iommu@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 23:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=U351JvvrUIKbZl9hwurByEIrOwE1UTYWyu5RTXsff14=;
	b=JQkFeI2Ckq2Rm5uRE42SdA2OmoBiV3N3O0ji0K24+rz9oayPgu9p2aNuNAJX7eYGEm
	+vQHr39PPjIQNr3iuR2ox30KW25VpcaIUD+ko+4wV2A2KyNVaPubLc49586VDHHstWDG
	PQ7TGmfTrqjwjpRl73pXZ+bTbRhoOG+R6ZzQZMBErhA4IS+/P7vaoDYEAreyiEhYzmaA
	9ZSIcTE9EYjdJTJMFJw//R+lsQ3kepLb7bjsizhe6eBcX/OZOFf/BJDvl73+Qi/4lWBm
	CriTvBxT0SdGxBYGqJ1KUIX9aV9YvnT6Io1/X4h8dXLpyjn+zKOA0xLPaLWI6SrMBtih
	L4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=U351JvvrUIKbZl9hwurByEIrOwE1UTYWyu5RTXsff14=;
	b=QdNp4liAgbwU5OYn68e+oMkBVe5oBJ4wBQx9HkD0vH+fh8zZ/rVv4V8LkpzLAA4oqL
	ysllWbVXMTldWFhoshH6DlFvgOaoX0FRMR++6KRvCtEd+BLxyrMsGbwLQEmasa4rDYbd
	c+3LfPpVV5UsZDmcE+kHk35cYIsQP2IGeoajacf1gdg5E1f7w8drorzOd7WmOiZZgLHz
	JhFGWk1vwyKwe5GUQx/tg0NBmKI4jWYfQKuLAA13Xj50D2VM+EITH5JLdP6q2s/Wdkh6
	yLpA72jTkkwkFTkeoVsDrL5rAskxL2Bctok5YX1qlLz71O+xEOhnKGWBgUXPuptbo/MI
	HN+A==
X-Gm-Message-State: APjAAAVD973Ct2CPeXLjj5dmLF4TV56Z5Gpuzxv5o21I1ZeWRQJetq6d
	A3AibYnSafY5M0PyAEux0PNetQ==
X-Google-Smtp-Source: APXvYqzxk9YLnauE4EeIMy5M04DowOJ0Ut668MwZbsJjai1C+hYm0uAAb2XwqLPzQ9+gp8wqlagXpw==
X-Received: by 2002:a17:90a:b118:: with SMTP id
	z24mr4197182pjq.120.1572331246730; 
	Mon, 28 Oct 2019 23:40:46 -0700 (PDT)
Received: from localhost.localdomain ([240e:362:4dc:3a00:892e:70f7:f486:8f02])
	by smtp.gmail.com with ESMTPSA id
	e23sm13421834pgh.84.2019.10.28.23.40.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Oct 2019 23:40:46 -0700 (PDT)
From: Zhangfei Gao <zhangfei.gao@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Herbert Xu <herbert@gondor.apana.org.au>,
	jonathan.cameron@huawei.com, grant.likely@arm.com,
	jean-philippe <jean-philippe@linaro.org>,
	Jerome Glisse <jglisse@redhat.com>, ilias.apalodimas@linaro.org,
	francois.ozog@linaro.org, kenneth-lee-2012@foxmail.com,
	Wangzhou <wangzhou1@hisilicon.com>,
	"haojian . zhuang" <haojian.zhuang@linaro.org>, guodong.xu@linaro.org
Subject: [PATCH v7 0/3] Add uacce module for Accelerator
Date: Tue, 29 Oct 2019 14:40:13 +0800
Message-Id: <1572331216-9503-1-git-send-email-zhangfei.gao@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Tue, 29 Oct 2019 07:42:33 +0000
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-accelerators@lists.ozlabs.org,
	linux-crypto@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Development issues for Linux IOMMU support
	<iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Uacce (Unified/User-space-access-intended Accelerator Framework) targets to
provide Shared Virtual Addressing (SVA) between accelerators and processes.
So accelerator can access any data structure of the main cpu.
This differs from the data sharing between cpu and io device, which share
data content rather than address.
Because of unified address, hardware and user space of process can share
the same virtual address in the communication.

Uacce is intended to be used with Jean Philippe Brucker's SVA
patchset[1], which enables IO side page fault and PASID support. 
We have keep verifying with Jean's sva/current [2]
We also keep verifying with Eric's SMMUv3 Nested Stage patch [3]

This series and related zip & qm driver
https://github.com/Linaro/linux-kernel-warpdrive/tree/5.4-rc4-uacce-v7

The library and user application:
https://github.com/Linaro/warpdrive/tree/wdprd-upstream-v7

References:
[1] http://jpbrucker.net/sva/
[2] http://www.linux-arm.org/git?p=linux-jpb.git;a=shortlog;h=refs/heads/sva/current
[3] https://github.com/eauger/linux/tree/v5.3.0-rc0-2stage-v9

Change History:
v7:
As suggested by Jean and Jerome
Only consider sva case and remove unused dma apis for the first patch.
Also add mm_exit for sva and vm_ops.close etc


v6: https://lkml.org/lkml/2019/10/16/231
Change sys qfrs_size to different file, suggested by Jonathan
Fix crypto daily build issue and based on crypto code base, also 5.4-rc1.

v5: https://lkml.org/lkml/2019/10/14/74
Add an example patch using the uacce interface, suggested by Greg
0003-crypto-hisilicon-register-zip-engine-to-uacce.patch

v4: https://lkml.org/lkml/2019/9/17/116
Based on 5.4-rc1
Considering other driver integrating uacce, 
if uacce not compiled, uacce_register return error and uacce_unregister is empty.
Simplify uacce flag: UACCE_DEV_SVA.
Address Greg's comments: 
Fix state machine, remove potential syslog triggered from user space etc.

v3: https://lkml.org/lkml/2019/9/2/990
Recommended by Greg, use sturct uacce_device instead of struct uacce,
and use struct *cdev in struct uacce_device, as a result, 
cdev can be released by itself when refcount decreased to 0.
So the two structures are decoupled and self-maintained by themsleves.
Also add dev.release for put_device.

v2: https://lkml.org/lkml/2019/8/28/565
Address comments from Greg and Jonathan
Modify interface uacce_register
Drop noiommu mode first

v1: https://lkml.org/lkml/2019/8/14/277
1. Rebase to 5.3-rc1
2. Build on iommu interface
3. Verifying with Jean's sva and Eric's nested mode iommu.
4. User library has developed a lot: support zlib, openssl etc.
5. Move to misc first

RFC3:
https://lkml.org/lkml/2018/11/12/1951

RFC2:
https://lwn.net/Articles/763990/


Background of why Uacce:
Von Neumann processor is not good at general data manipulation.
It is designed for control-bound rather than data-bound application.
The latter need less control path facility and more/specific ALUs.
So there are more and more heterogeneous processors, such as
encryption/decryption accelerators, TPUs, or
EDGE (Explicated Data Graph Execution) processors, introduced to gain
better performance or power efficiency for particular applications
these days.

There are generally two ways to make use of these heterogeneous processors:

The first is to make them co-processors, just like FPU.
This is good for some application but it has its own cons:
It changes the ISA set permanently.
You must save all state elements when the process is switched out.
But most data-bound processors have a huge set of state elements.
It makes the kernel scheduler more complex.

The second is Accelerator.
It is taken as a IO device from the CPU's point of view
(but it need not to be physically). The process, running on CPU,
hold a context of the accelerator and send instructions to it as if
it calls a function or thread running with FPU.
The context is bound with the processor itself.
So the state elements remain in the hardware context until
the context is released.

We believe this is the core feature of an "Accelerator" vs. Co-processor
or other heterogeneous processors.

The intention of Uacce is to provide the basic facility to backup
this scenario. Its first step is to make sure the accelerator and process
can share the same address space. So the accelerator ISA can directly
address any data structure of the main CPU.
This differs from the data sharing between CPU and IO device,
which share data content rather than address.
So it is different comparing to the other DMA libraries.

In the future, we may add more facility to support linking accelerator
library to the main application, or managing the accelerator context as
special thread.
But no matter how, this can be a solid start point for new processor
to be used as an "accelerator" as this is the essential requirement.


The Fork Scenario
=================
For a process with allocated queues and shared memory, what happen if it forks
a child?

The fd of the queue is duplicated on fork, but requests sent from the child
process are blocked.

It is recommended to add O_CLOEXEC to the queue file.

The queue mmap space has a VM_DONTCOPY in its VMA. So the child will lose all
those VMAs.

This is a reason why Uacce does not adopt the mode used in VFIO and
InfiniBand.  Both solutions can set any user pointer for hardware sharing.
But they cannot support fork when the dma is in process. Or the
"Copy-On-Write" procedure will make the parent process lost its physical
pages.


Difference to the VFIO and IB framework
---------------------------------------
The essential function of Uacce is to let the device access the user
address directly. There are many device drivers doing the same in the kernel.
And both VFIO and IB can provide similar functions in framework level.

But Uacce has a different goal: "share address space". It is
not taken the request to the accelerator as an enclosure data structure. It
takes the accelerator as another thread of the same process. So the
accelerator can refer to any address used by the process.

Both VFIO and IB are taken this as "memory sharing", not "address sharing".
They care more on sharing the block of memory. But if there is an address
stored in the block and referring to another memory region. The address may
not be valid.

By adding more constraints to the VFIO and IB framework, in some sense, we may
achieve a similar goal. But we gave it up finally. Both VFIO and IB have extra
assumption which is unnecessary to Uacce. They may hurt each other if we
try to merge them together.

VFIO manages resource of a hardware as a "virtual device". If a device need to
serve a separated application. It must isolate the resource as a separate
virtual device.  And the life cycle of the application and virtual device are
unnecessary unrelated. And most concepts, such as bus, driver, probe and
so on, to make it as a "device" is unnecessary either. And the logic added to
VFIO to make address sharing do no help on "creating a virtual device".

IB creates a "verbs" standard for sharing memory region to another remote
entity.  Most of these verbs are to make memory region between entities to be
synchronized.  This is not what accelerator need. Accelerator is in the same
memory system with the CPU. It refers to the same memory system among CPU and
devices. So the local memory terms/verbs are good enough for it. Extra "verbs"
are not necessary. And its queue (like queue pair in IB) is the communication
channel direct to the accelerator hardware. There is nothing about memory
itself.

Further, both VFIO and IB use the "pin" (get_user_page) way to lock local
memory in place.  This is flexible. But it can cause other problems. For
example, if the user process fork a child process. The COW procedure may make
the parent process lost its pages which are sharing with the device. These may
be fixed in the future. But is not going to be easy. (There is a discussion
about this on Linux Plumbers Conference 2018 [1])

So we choose to build the solution directly on top of IOMMU interface. IOMMU
is the essential way for device and process to share their page mapping from
the hardware perspective. It will be safe to create a software solution on
this assumption.  Uacce manages the IOMMU interface for the accelerator
device, so the device driver can export some of the resources to the user
space. Uacce than can make sure the device and the process have the same
address space.


References
==========
.. [1] https://lwn.net/Articles/774411/

Kenneth Lee (2):
  uacce: Add documents for uacce
  uacce: add uacce driver

Zhangfei Gao (1):
  crypto: hisilicon - register zip engine to uacce

 Documentation/ABI/testing/sysfs-driver-uacce |  53 +++
 Documentation/misc-devices/uacce.rst         | 160 ++++++++
 drivers/crypto/hisilicon/qm.c                | 253 +++++++++++-
 drivers/crypto/hisilicon/qm.h                |  13 +-
 drivers/crypto/hisilicon/zip/zip_main.c      |  39 +-
 drivers/misc/Kconfig                         |   1 +
 drivers/misc/Makefile                        |   1 +
 drivers/misc/uacce/Kconfig                   |  13 +
 drivers/misc/uacce/Makefile                  |   2 +
 drivers/misc/uacce/uacce.c                   | 574 +++++++++++++++++++++++++++
 include/linux/uacce.h                        | 163 ++++++++
 include/uapi/misc/uacce/qm.h                 |  23 ++
 include/uapi/misc/uacce/uacce.h              |  38 ++
 13 files changed, 1297 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-uacce
 create mode 100644 Documentation/misc-devices/uacce.rst
 create mode 100644 drivers/misc/uacce/Kconfig
 create mode 100644 drivers/misc/uacce/Makefile
 create mode 100644 drivers/misc/uacce/uacce.c
 create mode 100644 include/linux/uacce.h
 create mode 100644 include/uapi/misc/uacce/qm.h
 create mode 100644 include/uapi/misc/uacce/uacce.h

-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
