Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9844C135F73
	for <lists.iommu@lfdr.de>; Thu,  9 Jan 2020 18:38:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 42EA086E5C;
	Thu,  9 Jan 2020 17:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QpMvTeMEBj0x; Thu,  9 Jan 2020 17:38:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 42A2D87952;
	Thu,  9 Jan 2020 17:38:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2779AC0881;
	Thu,  9 Jan 2020 17:38:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 623C3C1D85
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 17:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 52E0A86C18
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 17:38:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8bx6keT9REW for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 17:38:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3C0AB86F92
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 17:38:25 +0000 (UTC)
Received: from lhreml702-cah.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 63D7074D89B6C389E9A8;
 Thu,  9 Jan 2020 17:38:21 +0000 (GMT)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml702-cah.china.huawei.com (10.201.108.43) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 9 Jan 2020 17:38:20 +0000
Received: from localhost (10.202.226.57) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 9 Jan 2020
 17:38:20 +0000
Date: Thu, 9 Jan 2020 17:38:19 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhangfei Gao <zhangfei.gao@linaro.org>, Kenneth Lee
 <liguozhu@hisilicon.com>
Subject: Re: [PATCH v10 2/4] uacce: add uacce driver
Message-ID: <20200109173819.00003cbf@Huawei.com>
In-Reply-To: <1576465697-27946-3-git-send-email-zhangfei.gao@linaro.org>
References: <1576465697-27946-1-git-send-email-zhangfei.gao@linaro.org>
 <1576465697-27946-3-git-send-email-zhangfei.gao@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.226.57]
X-ClientProxiedBy: lhreml711-chm.china.huawei.com (10.201.108.62) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Cc: jean-philippe <jean-philippe@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 francois.ozog@linaro.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 ilias.apalodimas@linaro.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Jerome
 Glisse <jglisse@redhat.com>, grant.likely@arm.com,
 "haojian . zhuang" <haojian.zhuang@linaro.org>,
 linux-accelerators@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 guodong.xu@linaro.org, kenneth-lee-2012@foxmail.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Mon, 16 Dec 2019 11:08:15 +0800
Zhangfei Gao <zhangfei.gao@linaro.org> wrote:

> From: Kenneth Lee <liguozhu@hisilicon.com>
> 
> Uacce (Unified/User-space-access-intended Accelerator Framework) targets to
> provide Shared Virtual Addressing (SVA) between accelerators and processes.
> So accelerator can access any data structure of the main cpu.
> This differs from the data sharing between cpu and io device, which share
> only data content rather than address.
> Since unified address, hardware and user space of process can share the
> same virtual address in the communication.
> 
> Uacce create a chrdev for every registration, the queue is allocated to
> the process when the chrdev is opened. Then the process can access the
> hardware resource by interact with the queue file. By mmap the queue
> file space to user space, the process can directly put requests to the
> hardware without syscall to the kernel space.
> 
> The IOMMU core only tracks mm<->device bonds at the moment, because it
> only needs to handle IOTLB invalidation and PASID table entries. However
> uacce needs a finer granularity since multiple queues from the same
> device can be bound to an mm. When the mm exits, all bound queues must
> be stopped so that the IOMMU can safely clear the PASID table entry and
> reallocate the PASID.
> 
> An intermediate struct uacce_mm links uacce devices and queues.
> Note that an mm may be bound to multiple devices but an uacce_mm
> structure only ever belongs to a single device, because we don't need
> anything more complex (if multiple devices are bound to one mm, then
> we'll create one uacce_mm for each bond).
> 
>         uacce_device --+-- uacce_mm --+-- uacce_queue
>                        |              '-- uacce_queue
>                        |
>                        '-- uacce_mm --+-- uacce_queue
>                                       +-- uacce_queue
>                                       '-- uacce_queue
> 
> Signed-off-by: Kenneth Lee <liguozhu@hisilicon.com>
> Signed-off-by: Zaibo Xu <xuzaibo@huawei.com>
> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>

Hi,

Two small things I'd missed previously.  Fix those and for
what it's worth

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  Documentation/ABI/testing/sysfs-driver-uacce |  37 ++
>  drivers/misc/Kconfig                         |   1 +
>  drivers/misc/Makefile                        |   1 +
>  drivers/misc/uacce/Kconfig                   |  13 +
>  drivers/misc/uacce/Makefile                  |   2 +
>  drivers/misc/uacce/uacce.c                   | 628 +++++++++++++++++++++++++++
>  include/linux/uacce.h                        | 161 +++++++
>  include/uapi/misc/uacce/uacce.h              |  38 ++
>  8 files changed, 881 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-uacce
>  create mode 100644 drivers/misc/uacce/Kconfig
>  create mode 100644 drivers/misc/uacce/Makefile
>  create mode 100644 drivers/misc/uacce/uacce.c
>  create mode 100644 include/linux/uacce.h
>  create mode 100644 include/uapi/misc/uacce/uacce.h
> 
...
> +
> +What:           /sys/class/uacce/<dev_name>/available_instances
> +Date:           Dec 2019
> +KernelVersion:  5.6
> +Contact:        linux-accelerators@lists.ozlabs.org
> +Description:    Available instances left of the device
> +                Return -ENODEV if uacce_ops get_available_instances is not provided
> +

See below.  It doesn't "return" it prints it currently.

...

> +static int uacce_fops_mmap(struct file *filep, struct vm_area_struct *vma)
> +{
> +	struct uacce_queue *q = filep->private_data;
> +	struct uacce_device *uacce = q->uacce;
> +	struct uacce_qfile_region *qfr;
> +	enum uacce_qfrt type = UACCE_MAX_REGION;
> +	int ret = 0;
> +
> +	if (vma->vm_pgoff < UACCE_MAX_REGION)
> +		type = vma->vm_pgoff;
> +	else
> +		return -EINVAL;
> +
> +	qfr = kzalloc(sizeof(*qfr), GFP_KERNEL);
> +	if (!qfr)
> +		return -ENOMEM;
> +
> +	vma->vm_flags |= VM_DONTCOPY | VM_DONTEXPAND | VM_WIPEONFORK;
> +	vma->vm_ops = &uacce_vm_ops;
> +	vma->vm_private_data = q;
> +	qfr->type = type;
> +
> +	mutex_lock(&uacce_mutex);
> +
> +	if (q->state != UACCE_Q_INIT && q->state != UACCE_Q_STARTED) {
> +		ret = -EINVAL;
> +		goto out_with_lock;
> +	}
> +
> +	if (q->qfrs[type]) {
> +		ret = -EEXIST;
> +		goto out_with_lock;
> +	}
> +
> +	switch (type) {
> +	case UACCE_QFRT_MMIO:
> +		if (!uacce->ops->mmap) {
> +			ret = -EINVAL;
> +			goto out_with_lock;
> +		}
> +
> +		ret = uacce->ops->mmap(q, vma, qfr);
> +		if (ret)
> +			goto out_with_lock;
> +
> +		break;
> +
> +	case UACCE_QFRT_DUS:
> +		if (uacce->flags & UACCE_DEV_SVA) {
> +			if (!uacce->ops->mmap) {
> +				ret = -EINVAL;
> +				goto out_with_lock;
> +			}
> +
> +			ret = uacce->ops->mmap(q, vma, qfr);
> +			if (ret)
> +				goto out_with_lock;
> +		}

Slightly odd corner case, but what stops us getting here with
the UACCE_DEV_SVA flag not set?  If that happened I'd expect to
return an error but looks like we return 0.



> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +		goto out_with_lock;
> +	}
> +
> +	q->qfrs[type] = qfr;
> +	mutex_unlock(&uacce_mutex);
> +
> +	return ret;
> +
> +out_with_lock:
> +	mutex_unlock(&uacce_mutex);
> +	kfree(qfr);
> +	return ret;
> +}

...

> +static ssize_t available_instances_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buf)
> +{
> +	struct uacce_device *uacce = to_uacce_device(dev);
> +	int val = -ENODEV;
> +
> +	if (uacce->ops->get_available_instances)
> +		val = uacce->ops->get_available_instances(uacce);
> +
> +	return sprintf(buf, "%d\n", val);

It's unusual to pass an error value back as a string.
I'd expect some logic like..

	if (val < 0)
		return val;

	return sprintf(buf, "%d\n", val);

Note this is the documented behavior "returns -ENODEV".

> +}
> +
> +static ssize_t algorithms_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct uacce_device *uacce = to_uacce_device(dev);
> +
> +	return sprintf(buf, "%s\n", uacce->algs);
> +}
> +
...


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
