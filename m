Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E293CEB66D
	for <lists.iommu@lfdr.de>; Thu, 31 Oct 2019 18:54:12 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B8753E1A;
	Thu, 31 Oct 2019 17:54:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EC9F4DDE
	for <iommu@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 17:54:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CD68F87B
	for <iommu@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 17:54:03 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 9F120B745E310E6913F0;
	Fri,  1 Nov 2019 01:53:58 +0800 (CST)
Received: from localhost (10.202.226.61) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Fri, 1 Nov 2019
	01:53:51 +0800
Date: Thu, 31 Oct 2019 15:37:11 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v7 1/3] uacce: Add documents for uacce
Message-ID: <20191031153711.00001708@huawei.com>
In-Reply-To: <1572331216-9503-2-git-send-email-zhangfei.gao@linaro.org>
References: <1572331216-9503-1-git-send-email-zhangfei.gao@linaro.org>
	<1572331216-9503-2-git-send-email-zhangfei.gao@linaro.org>
Organization: Huawei
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.226.61]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jean-philippe <jean-philippe@linaro.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Arnd Bergmann <arnd@arndb.de>, francois.ozog@linaro.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ilias.apalodimas@linaro.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, Jerome
	Glisse <jglisse@redhat.com>, grant.likely@arm.com,
	"haojian . zhuang" <haojian.zhuang@linaro.org>,
	linux-accelerators@lists.ozlabs.org, linux-crypto@vger.kernel.org,
	Kenneth Lee <liguozhu@hisilicon.com>, guodong.xu@linaro.org,
	kenneth-lee-2012@foxmail.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Tue, 29 Oct 2019 14:40:14 +0800
Zhangfei Gao <zhangfei.gao@linaro.org> wrote:

> From: Kenneth Lee <liguozhu@hisilicon.com>
> 
> Uacce (Unified/User-space-access-intended Accelerator Framework) is
> a kernel module targets to provide Shared Virtual Addressing (SVA)
> between the accelerator and process.
> 
> This patch add document to explain how it works.
> 
> Signed-off-by: Kenneth Lee <liguozhu@hisilicon.com>
> Signed-off-by: Zaibo Xu <xuzaibo@huawei.com>
> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
> Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> ---
>  Documentation/misc-devices/uacce.rst | 160 +++++++++++++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 Documentation/misc-devices/uacce.rst
> 
> diff --git a/Documentation/misc-devices/uacce.rst b/Documentation/misc-devices/uacce.rst
> new file mode 100644
> index 0000000..ecd5d8b
> --- /dev/null
> +++ b/Documentation/misc-devices/uacce.rst
> @@ -0,0 +1,160 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Introduction of Uacce
> +=========================

Fix the underline length to match the title.

> +
> +Uacce (Unified/User-space-access-intended Accelerator Framework) targets to
> +provide Shared Virtual Addressing (SVA) between accelerators and processes.
> +So accelerator can access any data structure of the main cpu.
> +This differs from the data sharing between cpu and io device, which share
> +data content rather than address.

which share only data content rather than address.

> +Because of the unified address, hardware and user space of process can
> +share the same virtual address in the communication.
> +Uacce takes the hardware accelerator as a heterogeneous processor, while
> +IOMMU share the same CPU page tables and as a result the same translation
> +from va to pa.
> +
> +	 __________________________       __________________________
> +	|                          |     |                          |
> +	|  User application (CPU)  |     |   Hardware Accelerator   |
> +	|__________________________|     |__________________________|
> +
> +	             |                                 |
> +	             | va                              | va
> +	             V                                 V
> +                 __________                        __________
> +                |          |                      |          |
> +                |   MMU    |                      |  IOMMU   |
> +                |__________|                      |__________|
> +		     |                                 |
> +	             |                                 |
> +	             V pa                              V pa
> +		 _______________________________________
> +		|                                       |
> +		|              Memory                   |
> +		|_______________________________________|
> +
> +
> +
> +Architecture
> +------------
> +
> +Uacce is the kernel module, taking charge of iommu and address sharing.
> +The user drivers and libraries are called WarpDrive.
> +
> +The uacce device, built around the IOMMU SVA API, can access multiple
> +address spaces, including the one without PASID.
> +
> +A virtual concept, queue, is used for the communication. It provides a
> +FIFO-like interface. And it maintains a unified address space between the
> +application and all involved hardware.
> +
> +                             ___________________                  ________________
> +                            |                   |   user API     |                |
> +                            | WarpDrive library | ------------>  |  user driver   |
> +                            |___________________|                |________________|
> +                                     |                                    |
> +                                     |                                    |
> +                                     | queue fd                           |
> +                                     |                                    |
> +                                     |                                    |
> +                                     v                                    |
> +     ___________________         _________                                |
> +    |                   |       |         |                               | mmap memory
> +    | Other framework   |       |  uacce  |                               | r/w interface
> +    | crypto/nic/others |       |_________|                               |
> +    |___________________|                                                 |
> +             |                       |                                    |
> +             | register              | register                           |
> +             |                       |                                    |
> +             |                       |                                    |
> +             |                _________________       __________          |
> +             |               |                 |     |          |         |
> +              -------------  |  Device Driver  |     |  IOMMU   |         |
> +                             |_________________|     |__________|         |
> +                                     |                                    |
> +                                     |                                    V
> +                                     |                            ___________________
> +                                     |                           |                   |
> +                                     --------------------------  |  Device(Hardware) |
> +                                                                 |___________________|
> +
> +
> +How does it work
> +================
> +
> +Uacce uses mmap and IOMMU to play the trick.
> +
> +Uacce create a chrdev for every device registered to it. New queue is
> +created when user application open the chrdev. The file descriptor is used
> +as the user handle of the queue.
> +The accelerator device present itself as an Uacce object, which exports as
> +chrdev to the user space. The user application communicates with the
> +hardware by ioctl (as control path) or share memory (as data path).
> +
> +The control path to the hardware is via file operation, while data path is
> +via mmap space of the queue fd.
> +
> +The queue file address space:
> +/**
> + * enum uacce_qfrt: qfrt type
> + * @UACCE_QFRT_MMIO: device mmio region
> + * @UACCE_QFRT_DUS: device user share region
> + */
> +enum uacce_qfrt {
> +	UACCE_QFRT_MMIO = 0,
> +	UACCE_QFRT_DUS = 1,
> +};
> +
> +All regions are optional and differ from device type to type. The
> +communication protocol is wrapped by the user driver.

Can you have more than one of each? If not state this clearly.

> +
> +The device mmio region is mapped to the hardware mmio space. It is generally
> +used for doorbell or other notification to the hardware. It is not fast enough
> +as data channel.
> +
> +The device user share region is used for share data buffer between user process
> +and device.
> +
> +
> +The Uacce register API
> +-----------------------
blank line here.

> +The register API is defined in uacce.h.
> +
> +struct uacce_interface {
> +	char name[UACCE_MAX_NAME_SIZE];
> +	enum uacce_dev_flag flags;

Having an enum for a flags variable / bitmap is odd.  Just use an
appropriate sized integer.

> +	struct uacce_ops *ops;
> +};
Use indenting to get literal formatting of this block. Will
give formatting like the code blocks in here compiled:
https://www.kernel.org/doc/html/latest/driver-api/iio/buffers.html

> +
> +According to the IOMMU capability, uacce_interface flags can be:
> +
> +/**
> + * enum uacce_dev_flag: Device flags:
> + * @UACCE_DEV_SVA: Shared Virtual Addresses
> + *		   Support PASID
> + *		   Support device page faults (PCI PRI or SMMU Stall)
> + */
> +enum uacce_dev_flag {
> +	UACCE_DEV_SVA = BIT(0),
> +};
> +
> +struct uacce_device *uacce_register(struct device *parent,
> +				    struct uacce_interface *interface);
> +void uacce_unregister(struct uacce_device *uacce);
> +
> +uacce_register results can be:
> +a. If uacce module is not compiled, ERR_PTR(-ENODEV)
> +b. Succeed with the desired flags
> +c. Succeed with the negotiated flags, for example
> +   uacce_interface.flags = UACCE_DEV_SVA but uacce->flags = ~UACCE_DEV_SVA
> +So user driver need check return value as well as the negotiated uacce->flags.
> +
> +
> +The user driver
> +---------------
> +
> +The queue file mmap space will need a user driver to wrap the communication
> +protocol. Uacce provides some attributes in sysfs for the user driver to
> +match the right accelerator accordingly.
> +More details in Documentation/ABI/testing/sysfs-driver-uacce.


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
