Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FC4551AB1
	for <lists.iommu@lfdr.de>; Mon, 20 Jun 2022 15:25:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40A0440AF3;
	Mon, 20 Jun 2022 13:25:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40A0440AF3
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ks9Ou/Wv
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 808k7Jn6tvxJ; Mon, 20 Jun 2022 13:25:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C149540914;
	Mon, 20 Jun 2022 13:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C149540914
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C388C0081;
	Mon, 20 Jun 2022 13:25:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C2CCC002D
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jun 2022 13:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F7FB60F86
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jun 2022 13:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F7FB60F86
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=Ks9Ou/Wv
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JDUn7Xy_Nsqz for <iommu@lists.linux-foundation.org>;
 Mon, 20 Jun 2022 13:24:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06F4360B4D
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06F4360B4D
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jun 2022 13:24:57 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id w17so14657199wrg.7
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jun 2022 06:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WkHQBMY5sZWHUTmAufsKBaQGlpK2u/YP0S0lHgpegqU=;
 b=Ks9Ou/Wv66FLVyAa7ZVYQGbjU5yUCUgt7VFRhMTEO+18jMLgPvyXqSrq/tkzkA1gNT
 G0VjlA+lxTcIclPrXRQKn8d7r24KUhD/BiWiQY0zRA9whMhLnxAQuDiuGFkEFG3OyMC/
 HS/iMVQprbKQie+jgIN0uovqZR8G8mvd6TR1OpTXNkW99aLUZK+Ii9H/S51ct6U802eT
 7Dl4da2nEIGnuSsS5dJ5ua+IMV+9IqknvB2CRo9yKGhNfftgQZTbML2BS2UKSsE1Afra
 NoIJVjF6f33yBMJ/isc34ck0tclLsw5iRdogqPO5A+pgBnwmmflJkEXz+ym94K7tRBn0
 Jddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WkHQBMY5sZWHUTmAufsKBaQGlpK2u/YP0S0lHgpegqU=;
 b=rLlmULumkABlBmknDQ8J/9vAIx/Cue1uZ41LKcPWj6bz8Jsgz2QhvRy7jZiQMicUBA
 ss20GWN06gnJl10U+BFnW1me1J/VDIosd0tuahWUXyTTTGrSXR1JB/T8yKngfpplp/x5
 UqX4Ffxb9TGUiq4YnXI08qPzos7a0cliYtJernQO0recorkmlvsFfe9XDdGc11HYNg/R
 /KyWUu/QdF5awAKuuNXodk9GSW9BaQnYC/sCEaCyTDsZaXiy1fYLTWa7g5RGvgk3KY0Z
 yvpoAp7lVnQo4l9yh6YXR757Jm9UJDWLeg05M3Q8LEFfxmXHt5n6tt/INGs6minVg721
 Q2lg==
X-Gm-Message-State: AJIora/CpHo0+NaLK7Y0sfathQM++ruQFnM8GExIoUC5/Ue9dI52qlY4
 4OpSYTqQQmoLCXg2bhGQ5b+Ezw==
X-Google-Smtp-Source: AGRyM1vnLhyNwYVcGCjuxl7HB9lldMaX7ispBSSxxxBQil3Xb0XAMuzJIk+0hoa9hWPFLdxKuUHl8A==
X-Received: by 2002:adf:decc:0:b0:21b:8915:36da with SMTP id
 i12-20020adfdecc000000b0021b891536damr10058759wrn.261.1655731496256; 
 Mon, 20 Jun 2022 06:24:56 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 x5-20020a5d54c5000000b0021b88ec99cesm6276585wrv.94.2022.06.20.06.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 06:24:55 -0700 (PDT)
Date: Mon, 20 Jun 2022 14:24:31 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: Re: [PATCH] uacce: fix concurrency of fops_open and uacce_remove
Message-ID: <YrB1D9rv9G4h/BYU@myrica>
References: <20220610123423.27496-1-zhangfei.gao@linaro.org>
 <Yqn3spLZHpAkQ9Us@myrica>
 <fdc8d8b0-4e04-78f5-1e8a-4cf44c89a37f@linaro.org>
 <YqrmdKNrYTCiS/MC@myrica>
 <d90e8ea5-2f18-2eda-b4b2-711083aa7ecd@linaro.org>
MIME-Version: 1.0
Content-Disposition: attachment
In-Reply-To: <d90e8ea5-2f18-2eda-b4b2-711083aa7ecd@linaro.org>
Cc: Yang Shen <shenyang39@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, linux-accelerators@lists.ozlabs.org
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

On Fri, Jun 17, 2022 at 02:05:21PM +0800, Zhangfei Gao wrote:
> > The refcount only ensures that the uacce_device object is not freed as
> > long as there are open fds. But uacce_remove() can run while there are
> > open fds, or fds in the process of being opened. And atfer uacce_remove()
> > runs, the uacce_device object still exists but is mostly unusable. For
> > example once the module is freed, uacce->ops is not valid anymore. But
> > currently uacce_fops_open() may dereference the ops in this case:
> > 
> > 	uacce_fops_open()
> > 	 if (!uacce->parent->driver)
> > 	 /* Still valid, keep going */		
> > 	 ...					rmmod
> > 						 uacce_remove()
> > 	 ...					 free_module()
> > 	 uacce->ops->get_queue() /* BUG */
> 
> uacce_remove should wait for uacce->queues_lock, until fops_open release the
> lock.
> If open happen just after the uacce_remove: unlock, uacce_bind_queue in open
> should fail.

Ah yes sorry, I lost sight of what this patch was adding. But we could
have the same issue with the patch, just in a different order, no?

	uacce_fops_open()
	 uacce = xa_load()
	 ...					rmmod
						 uacce_remove()
						  mutex_lock()
						  mutex_unlock()
	 mutex_lock()
	 if (!uacce->parent->driver)            
	 /* Still valid, keep going */		 parent->driver = NULL
						 free_module()
	 uacce->ops->get_queue() /* BUG */


> > Accessing uacce->ops after free_module() is a use-after-free. We need all
> you men parent release the resources.
> > the fops to synchronize with uacce_remove() to ensure they don't use any
> > resource of the parent after it's been freed.
> After fops_open, currently we are counting on parent driver stop all dma
> first, then call uacce_remove, which is assumption.
> Like drivers/crypto/hisilicon/zip/zip_main.c: hisi_qm_wait_task_finish,
> which will wait uacce_release.
> If comments this , there may other issue,
> Unable to handle kernel paging request at virtual address ffff80000b700204
> pc : hisi_qm_cache_wb.part.0+0x2c/0xa0
> 
> > I see uacce_fops_poll() may have the same problem, and should be inside
> > uacce_mutex.
> Do we need consider this, uacce_remove can happen anytime but not waiting
> dma stop?

No, the parent driver must stop DMA before calling uacce_remove(), there
is no way around that

> 
> Not sure uacce_mutex can do this.
> Currently the sequence is
> mutex_lock(&uacce->queues_lock);
> mutex_lock(&uacce_mutex);

We should document why some ops use one lock or the other. I believe it's
to avoid circular lock dependency between ioctl and mmap, do you know if
there was another reason?

> 
> Or we set all the callbacks of uacce_ops to NULL?

That would be cleaner, though we already use the queue state to indicate
whether it is usable or not. I think we just need to extend that to all
ops.

How about the following patch? Unfortunately it still has the lock
disparity between ioctl and mmap because of the circular lockking with
mmap_sem, I don't know how to make that cleaner.

--- 8< ---

From c7c2b051ec19285bbb973f8a2a5e58bb5326e00e Mon Sep 17 00:00:00 2001
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
Date: Mon, 20 Jun 2022 10:10:41 +0100
Subject: [PATCH] uacce: Tidy up locking

The uacce driver must deal with a possible removal of the parent driver
or device at any time. At the moment there are several issues that may
result in use-after-free. Tidy up the locking to handle module removal.

When unbinding the parent device from its driver, the driver calls
uacce_remove(). This function removes the cdev, ensuring that no new
uacce file descriptor will be opened, but existing fds are still open
and uacce fops may be called after uacce_remove() completes, when the
parent module is gone. Each open fd holds a reference to the uacce
device, ensuring that the structure cannot be freed until all fds are
closed. But the uacce fops may still access uacce->ops which belonged to
the parent module, now freed. To solve this:

* use the global uacce_mutex to serialize uacce_fops_open() against
  uacce_remove(), and q->mutex to serialize all other fops against
  uacce_remove().

* q->mutex replaces the less scalable uacce->queues_lock. The queues
  list is now protected by uacce_mutex, and the queue state by q->mutex.
  Note that scalability is only desirable for poll(), since the other
  fops are only used during setup.

* uacce_queue_is_valid(), checked under q->mutex, denotes whether
  uacce_remove() has disabled all queues. If that is the case, don't go
  any further since the parent module may be gone. Any call to
  uacce->ops must be done while holding q->mutex to ensure the state
  doesn't change.

* Clear uacce->ops in uacce_remove(), just to make sure that a
  programming error would result in NULL dereference rather than
  use-after-free.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/misc/uacce/uacce.c | 137 ++++++++++++++++++++++++-------------
 include/linux/uacce.h      |   4 +-
 2 files changed, 91 insertions(+), 50 deletions(-)

diff --git a/drivers/misc/uacce/uacce.c b/drivers/misc/uacce/uacce.c
index 281c54003edc..0bb2743d8da3 100644
--- a/drivers/misc/uacce/uacce.c
+++ b/drivers/misc/uacce/uacce.c
@@ -9,43 +9,40 @@
 
 static struct class *uacce_class;
 static dev_t uacce_devt;
+/* Protects uacce_xa and uacce->queues */
 static DEFINE_MUTEX(uacce_mutex);
 static DEFINE_XARRAY_ALLOC(uacce_xa);
 
-static int uacce_start_queue(struct uacce_queue *q)
+/*
+ * If the parent driver or the device disappears, the queue state is invalid and
+ * ops are not usable anymore.
+ */
+static bool uacce_queue_is_valid(struct uacce_queue *q)
 {
-	int ret = 0;
+	return q->state == UACCE_Q_INIT || q->state == UACCE_Q_STARTED;
+}
 
-	mutex_lock(&uacce_mutex);
+static int uacce_start_queue(struct uacce_queue *q)
+{
+	int ret;
 
-	if (q->state != UACCE_Q_INIT) {
-		ret = -EINVAL;
-		goto out_with_lock;
-	}
+	if (q->state != UACCE_Q_INIT)
+		return -EINVAL;
 
 	if (q->uacce->ops->start_queue) {
 		ret = q->uacce->ops->start_queue(q);
 		if (ret < 0)
-			goto out_with_lock;
+			return ret;
 	}
 
 	q->state = UACCE_Q_STARTED;
-
-out_with_lock:
-	mutex_unlock(&uacce_mutex);
-
-	return ret;
+	return 0;
 }
 
 static int uacce_put_queue(struct uacce_queue *q)
 {
 	struct uacce_device *uacce = q->uacce;
 
-	mutex_lock(&uacce_mutex);
-
-	if (q->state == UACCE_Q_ZOMBIE)
-		goto out;
-
 	if ((q->state == UACCE_Q_STARTED) && uacce->ops->stop_queue)
 		uacce->ops->stop_queue(q);
 
@@ -54,8 +51,6 @@ static int uacce_put_queue(struct uacce_queue *q)
 		uacce->ops->put_queue(q);
 
 	q->state = UACCE_Q_ZOMBIE;
-out:
-	mutex_unlock(&uacce_mutex);
 
 	return 0;
 }
@@ -65,20 +60,36 @@ static long uacce_fops_unl_ioctl(struct file *filep,
 {
 	struct uacce_queue *q = filep->private_data;
 	struct uacce_device *uacce = q->uacce;
+	long ret = -ENXIO;
+
+	/*
+	 * uacce->ops->ioctl() may take the mmap_sem in order to copy arg
+	 * to/from user. Avoid a circular lock dependency with
+	 * uacce_fops_mmap(), which gets called with mmap_sem held, by taking
+	 * uacce_mutex instead of q->mutex. Doing this in uacce_fops_mmap() is
+	 * not possible because uacce_fops_open() calls iommu_sva_bind_device(),
+	 * which takes mmap_sem, while holding uacce_mutex.
+	 */
+	mutex_lock(&uacce_mutex);
+	if (!uacce_queue_is_valid(q))
+		goto out_unlock;
 
 	switch (cmd) {
 	case UACCE_CMD_START_Q:
-		return uacce_start_queue(q);
-
+		ret = uacce_start_queue(q);
+		break;
 	case UACCE_CMD_PUT_Q:
-		return uacce_put_queue(q);
-
+		ret = uacce_put_queue(q);
+		break;
 	default:
-		if (!uacce->ops->ioctl)
-			return -EINVAL;
-
-		return uacce->ops->ioctl(q, cmd, arg);
+		if (uacce->ops->ioctl)
+			ret = uacce->ops->ioctl(q, cmd, arg);
+		else
+			ret = -EINVAL;
 	}
+out_unlock:
+	mutex_unlock(&uacce_mutex);
+	return ret;
 }
 
 #ifdef CONFIG_COMPAT
@@ -128,13 +139,18 @@ static int uacce_fops_open(struct inode *inode, struct file *filep)
 	struct uacce_queue *q;
 	int ret;
 
+	mutex_lock(&uacce_mutex);
 	uacce = xa_load(&uacce_xa, iminor(inode));
-	if (!uacce)
-		return -ENODEV;
+	if (!uacce) {
+		ret = -ENODEV;
+		goto out_with_lock;
+	}
 
 	q = kzalloc(sizeof(struct uacce_queue), GFP_KERNEL);
-	if (!q)
-		return -ENOMEM;
+	if (!q) {
+		ret = -ENOMEM;
+		goto out_with_lock;
+	}
 
 	ret = uacce_bind_queue(uacce, q);
 	if (ret)
@@ -152,10 +168,10 @@ static int uacce_fops_open(struct inode *inode, struct file *filep)
 	filep->private_data = q;
 	uacce->inode = inode;
 	q->state = UACCE_Q_INIT;
+	mutex_init(&q->mutex);
 
-	mutex_lock(&uacce->queues_lock);
 	list_add(&q->list, &uacce->queues);
-	mutex_unlock(&uacce->queues_lock);
+	mutex_unlock(&uacce_mutex);
 
 	return 0;
 
@@ -163,6 +179,8 @@ static int uacce_fops_open(struct inode *inode, struct file *filep)
 	uacce_unbind_queue(q);
 out_with_mem:
 	kfree(q);
+out_with_lock:
+	mutex_unlock(&uacce_mutex);
 	return ret;
 }
 
@@ -170,11 +188,11 @@ static int uacce_fops_release(struct inode *inode, struct file *filep)
 {
 	struct uacce_queue *q = filep->private_data;
 
-	mutex_lock(&q->uacce->queues_lock);
-	list_del(&q->list);
-	mutex_unlock(&q->uacce->queues_lock);
+	mutex_lock(&uacce_mutex);
 	uacce_put_queue(q);
 	uacce_unbind_queue(q);
+	list_del(&q->list);
+	mutex_unlock(&uacce_mutex);
 	kfree(q);
 
 	return 0;
@@ -217,10 +235,9 @@ static int uacce_fops_mmap(struct file *filep, struct vm_area_struct *vma)
 	vma->vm_private_data = q;
 	qfr->type = type;
 
-	mutex_lock(&uacce_mutex);
-
-	if (q->state != UACCE_Q_INIT && q->state != UACCE_Q_STARTED) {
-		ret = -EINVAL;
+	mutex_lock(&q->mutex);
+	if (!uacce_queue_is_valid(q)) {
+		ret = -ENXIO;
 		goto out_with_lock;
 	}
 
@@ -248,12 +265,12 @@ static int uacce_fops_mmap(struct file *filep, struct vm_area_struct *vma)
 	}
 
 	q->qfrs[type] = qfr;
-	mutex_unlock(&uacce_mutex);
+	mutex_unlock(&q->mutex);
 
 	return ret;
 
 out_with_lock:
-	mutex_unlock(&uacce_mutex);
+	mutex_unlock(&q->mutex);
 	kfree(qfr);
 	return ret;
 }
@@ -262,12 +279,20 @@ static __poll_t uacce_fops_poll(struct file *file, poll_table *wait)
 {
 	struct uacce_queue *q = file->private_data;
 	struct uacce_device *uacce = q->uacce;
+	int ret = 0;
 
 	poll_wait(file, &q->wait, wait);
+
+	mutex_lock(&q->mutex);
+	if (!uacce_queue_is_valid(q))
+		goto out_unlock;
+
 	if (uacce->ops->is_q_updated && uacce->ops->is_q_updated(q))
-		return EPOLLIN | EPOLLRDNORM;
+		ret = EPOLLIN | EPOLLRDNORM;
 
-	return 0;
+out_unlock:
+	mutex_unlock(&q->mutex);
+	return ret;
 }
 
 static const struct file_operations uacce_fops = {
@@ -450,7 +475,6 @@ struct uacce_device *uacce_alloc(struct device *parent,
 		goto err_with_uacce;
 
 	INIT_LIST_HEAD(&uacce->queues);
-	mutex_init(&uacce->queues_lock);
 	device_initialize(&uacce->dev);
 	uacce->dev.devt = MKDEV(MAJOR(uacce_devt), uacce->dev_id);
 	uacce->dev.class = uacce_class;
@@ -507,13 +531,23 @@ void uacce_remove(struct uacce_device *uacce)
 	if (uacce->inode)
 		unmap_mapping_range(uacce->inode->i_mapping, 0, 0, 1);
 
+	/*
+	 * uacce_fops_open() may be running concurrently, even after we remove
+	 * the cdev. Holding uacce_mutex ensures that open() does not obtain a
+	 * removed uacce device.
+	 */
+	mutex_lock(&uacce_mutex);
 	/* ensure no open queue remains */
-	mutex_lock(&uacce->queues_lock);
 	list_for_each_entry_safe(q, next_q, &uacce->queues, list) {
+		/*
+		 * Taking q->mutex ensures that fops do not use the defunct
+		 * uacce->ops after the queue is disabled.
+		 */
+		mutex_lock(&q->mutex);
 		uacce_put_queue(q);
+		mutex_unlock(&q->mutex);
 		uacce_unbind_queue(q);
 	}
-	mutex_unlock(&uacce->queues_lock);
 
 	/* disable sva now since no opened queues */
 	uacce_disable_sva(uacce);
@@ -521,7 +555,14 @@ void uacce_remove(struct uacce_device *uacce)
 	if (uacce->cdev)
 		cdev_device_del(uacce->cdev, &uacce->dev);
 	xa_erase(&uacce_xa, uacce->dev_id);
+	/*
+	 * uacce exists as long as there are open fds, but ops will be freed
+	 * now. Ensure that bugs cause NULL deref rather than use-after-free.
+	 */
+	uacce->ops = NULL;
+	uacce->parent = NULL;
 	put_device(&uacce->dev);
+	mutex_unlock(&uacce_mutex);
 }
 EXPORT_SYMBOL_GPL(uacce_remove);
 
diff --git a/include/linux/uacce.h b/include/linux/uacce.h
index 48e319f40275..1ea2d753ef89 100644
--- a/include/linux/uacce.h
+++ b/include/linux/uacce.h
@@ -70,6 +70,7 @@ enum uacce_q_state {
  * @wait: wait queue head
  * @list: index into uacce queues list
  * @qfrs: pointer of qfr regions
+ * @mutex: protects queue state
  * @state: queue state machine
  * @pasid: pasid associated to the mm
  * @handle: iommu_sva handle returned by iommu_sva_bind_device()
@@ -80,6 +81,7 @@ struct uacce_queue {
 	wait_queue_head_t wait;
 	struct list_head list;
 	struct uacce_qfile_region *qfrs[UACCE_MAX_REGION];
+	struct mutex mutex;
 	enum uacce_q_state state;
 	u32 pasid;
 	struct iommu_sva *handle;
@@ -99,7 +101,6 @@ struct uacce_queue {
  * @dev: dev of the uacce
  * @priv: private pointer of the uacce
  * @queues: list of queues
- * @queues_lock: lock for queues list
  * @inode: core vfs
  */
 struct uacce_device {
@@ -115,7 +116,6 @@ struct uacce_device {
 	struct device dev;
 	void *priv;
 	struct list_head queues;
-	struct mutex queues_lock;
 	struct inode *inode;
 };
 
-- 
2.25.1


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
