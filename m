Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E919B41CC49
	for <lists.iommu@lfdr.de>; Wed, 29 Sep 2021 21:05:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D635835CF;
	Wed, 29 Sep 2021 19:05:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uqo23PMuVFhg; Wed, 29 Sep 2021 19:05:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 77E22835DF;
	Wed, 29 Sep 2021 19:05:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 179CFC0022;
	Wed, 29 Sep 2021 19:05:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FC92C000D
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 19:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ACE64235B
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 19:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id avIxYfmmUw2b for <iommu@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 19:05:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A31641964
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 19:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632942327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=85NOeq9kRcTFRqNT/gP4PrOFWq1cbQJO0LsYgy0Arqs=;
 b=WbgEBH+TRdu9jrH1yEgbqr1FyLGxF7oVgPwsBsDqG1PPIE5MyZ2udYpyeZYAEPwdXASEHy
 1goXdfZrKOnk9gK2jtVAg85ZQpHLnkPn26Q/8AvOH5kbE++tZa0A8DY8kwfFJQ7SHJSx5k
 0AD2LXfWxRqG8FkmYmeYS1GJbJrAHPo=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-d8GRnuXMPHm2Qjj7fl-LZw-1; Wed, 29 Sep 2021 15:05:24 -0400
X-MC-Unique: d8GRnuXMPHm2Qjj7fl-LZw-1
Received: by mail-oo1-f71.google.com with SMTP id
 o16-20020a4a3850000000b002ac67e1a6e9so2850109oof.14
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 12:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=85NOeq9kRcTFRqNT/gP4PrOFWq1cbQJO0LsYgy0Arqs=;
 b=wiZFWO7j5zd5+jR+xPjYqro7UJDRY2Wd8xGP6G3mNLkN/DqeLzR62Oeut33k845Y7i
 V7bwKCLIolJAKcCjk5CA8tQaiRxM/jVJ9iPbUyF5uh0jyaXPJyv/qCiBiHWUXeW1w8B4
 9g/zTimcRAM2WC07NyKA88EPnsFe9dkSORKDHdcvcb2oAKtE99T7oEswfryijz4u6tLo
 91qP43Pe6bUHGtMcw2ndE3eu6lDNmgpDrhfYYs0pBMTwp+7fQobaQgnlzrMyZS0xNsvW
 C7W0V8PVjW9d5a1pjoz4CnPzce9cnFaZmJJIrx0PxF6qGcvl0FIk31TUZPlr9zt2gTfg
 Q/ew==
X-Gm-Message-State: AOAM531byGEc1GF51W5GgXAZfwkzo4vhw9RBYc3fACqBuEAXpsaHuTPY
 EzAm2ahNYqORUq1LFNU4Ye5wL4WxNOz2SO71c+s0UKOY82kRgOK5UpEqmSEKd6HzH2YeCCriGRs
 Yc9gUBE3k/45sH68n+al38tw5DFI1Lg==
X-Received: by 2002:a9d:4705:: with SMTP id a5mr1401111otf.237.1632942323877; 
 Wed, 29 Sep 2021 12:05:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+KGp/sh/UihDrTdyYD4Z3RDCBe5RWKG52xsBpGNBpcqEB4R141NFhp0vsmLjZ8H3+PuwzlA==
X-Received: by 2002:a9d:4705:: with SMTP id a5mr1401070otf.237.1632942323621; 
 Wed, 29 Sep 2021 12:05:23 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id p9sm111523ots.66.2021.09.29.12.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 12:05:23 -0700 (PDT)
Date: Wed, 29 Sep 2021 13:05:21 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC 02/20] vfio: Add device class for /dev/vfio/devices
Message-ID: <20210929130521.738c56ed.alex.williamson@redhat.com>
In-Reply-To: <YVPKu/F3IpPMtGCh@yekko>
References: <20210919063848.1476776-1-yi.l.liu@intel.com>
 <20210919063848.1476776-3-yi.l.liu@intel.com>
 <YVPKu/F3IpPMtGCh@yekko>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: kvm@vger.kernel.org, jasowang@redhat.com, kwankhede@nvidia.com, hch@lst.de,
 jean-philippe@linaro.org, dave.jiang@intel.com, ashok.raj@intel.com,
 corbet@lwn.net, jgg@nvidia.com, kevin.tian@intel.com, parav@mellanox.com,
 lkml@metux.net, dwmw2@infradead.org, jun.j.tian@intel.com,
 linux-kernel@vger.kernel.org, lushenming@huawei.com,
 iommu@lists.linux-foundation.org, pbonzini@redhat.com, robin.murphy@arm.com
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

On Wed, 29 Sep 2021 12:08:59 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Sun, Sep 19, 2021 at 02:38:30PM +0800, Liu Yi L wrote:
> > This patch introduces a new interface (/dev/vfio/devices/$DEVICE) for
> > userspace to directly open a vfio device w/o relying on container/group
> > (/dev/vfio/$GROUP). Anything related to group is now hidden behind
> > iommufd (more specifically in iommu core by this RFC) in a device-centric
> > manner.
> > 
> > In case a device is exposed in both legacy and new interfaces (see next
> > patch for how to decide it), this patch also ensures that when the device
> > is already opened via one interface then the other one must be blocked.
> > 
> > Signed-off-by: Liu Yi L <yi.l.liu@intel.com>  
> [snip]
> 
> > +static bool vfio_device_in_container(struct vfio_device *device)
> > +{
> > +	return !!(device->group && device->group->container);  
> 
> You don't need !! here.  && is already a logical operation, so returns
> a valid bool.
> 
> > +}
> > +
> >  static int vfio_device_fops_release(struct inode *inode, struct file *filep)
> >  {
> >  	struct vfio_device *device = filep->private_data;
> > @@ -1560,7 +1691,16 @@ static int vfio_device_fops_release(struct inode *inode, struct file *filep)
> >  
> >  	module_put(device->dev->driver->owner);
> >  
> > -	vfio_group_try_dissolve_container(device->group);
> > +	if (vfio_device_in_container(device)) {
> > +		vfio_group_try_dissolve_container(device->group);
> > +	} else {
> > +		atomic_dec(&device->opened);
> > +		if (device->group) {
> > +			mutex_lock(&device->group->opened_lock);
> > +			device->group->opened--;
> > +			mutex_unlock(&device->group->opened_lock);
> > +		}
> > +	}
> >  
> >  	vfio_device_put(device);
> >  
> > @@ -1613,6 +1753,7 @@ static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
> >  
> >  static const struct file_operations vfio_device_fops = {
> >  	.owner		= THIS_MODULE,
> > +	.open		= vfio_device_fops_open,
> >  	.release	= vfio_device_fops_release,
> >  	.read		= vfio_device_fops_read,
> >  	.write		= vfio_device_fops_write,
> > @@ -2295,6 +2436,52 @@ static struct miscdevice vfio_dev = {
> >  	.mode = S_IRUGO | S_IWUGO,
> >  };
> >  
> > +static char *vfio_device_devnode(struct device *dev, umode_t *mode)
> > +{
> > +	return kasprintf(GFP_KERNEL, "vfio/devices/%s", dev_name(dev));  
> 
> Others have pointed out some problems with the use of dev_name()
> here.  I'll add that I think you'll make things much easier if instead
> of using one huge "devices" subdir, you use a separate subdir for each
> vfio sub-driver (so, one for PCI, one for each type of mdev, one for
> platform, etc.).  That should make avoiding name conflicts a lot simpler.

It seems like this is unnecessary if we use the vfioX naming approach.
Conflicts are trivial to ignore if we don't involve dev_name() and
looking for the correct major:minor chardev in the correct subdirectory
seems like a hassle for userspace.  Thanks,

Alex

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
