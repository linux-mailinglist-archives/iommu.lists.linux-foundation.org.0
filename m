Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0EC39557B
	for <lists.iommu@lfdr.de>; Mon, 31 May 2021 08:32:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2768D83B7D;
	Mon, 31 May 2021 06:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g9OC5YQ66ooZ; Mon, 31 May 2021 06:32:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE1D683AD4;
	Mon, 31 May 2021 06:32:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6EC1C0001;
	Mon, 31 May 2021 06:32:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE917C0001;
 Mon, 31 May 2021 06:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9740B4036F;
 Mon, 31 May 2021 06:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ogW6ypjRwmFb; Mon, 31 May 2021 06:32:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A1B540376;
 Mon, 31 May 2021 06:32:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A17661002;
 Mon, 31 May 2021 06:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622442730;
 bh=/Rpow5pd3vI3QDiPLujMq5XYut4dwN7beksCj+Osmiw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VafGWsZBf8JY9hyaPQA2lYDCFBVOsJdxrXv6Ao4UOn9xAR5q75AQDEMjMNgdMIEZB
 6dFZCv8k/YU22mPbGQ6Yw0mZr/cbVfo08aoF91SsFjWMAMKhxQobvj8iQhm6dPrCXu
 ZdZKoa1KQCAFM7bTKNo/9xjeEFXT3xPGBt94IdM4=
Date: Mon, 31 May 2021 08:32:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yongji Xie <xieyongji@bytedance.com>
Subject: Re: Re: [PATCH v7 11/12] vduse: Introduce VDUSE - vDPA Device in
 Userspace
Message-ID: <YLSC6AthAl+VeQsv@kroah.com>
References: <20210517095513.850-1-xieyongji@bytedance.com>
 <20210517095513.850-12-xieyongji@bytedance.com>
 <YLRsehBRAiCJEDl0@kroah.com>
 <CACycT3vRHPfOGxmy1Uv=8_dqqq8iG4YTZHUizo+y8EYKGS5g8g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACycT3vRHPfOGxmy1Uv=8_dqqq8iG4YTZHUizo+y8EYKGS5g8g@mail.gmail.com>
Cc: kvm <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Christian Brauner <christian.brauner@canonical.com>,
 Jonathan Corbet <corbet@lwn.net>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 bcrl@kvack.org, linux-fsdevel@vger.kernel.org,
 Mika =?iso-8859-1?Q?Penttil=E4?= <mika.penttila@nextfour.com>
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

On Mon, May 31, 2021 at 02:19:37PM +0800, Yongji Xie wrote:
> Hi Greg,
> 
> Thanks a lot for the review!
> 
> On Mon, May 31, 2021 at 12:56 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, May 17, 2021 at 05:55:12PM +0800, Xie Yongji wrote:
> > > +struct vduse_dev {
> > > +     struct vduse_vdpa *vdev;
> > > +     struct device dev;
> > > +     struct cdev cdev;
> >
> > You now have 2 reference counted devices controling the lifespace of a
> > single structure.  A mess that is guaranteed to go wrong.  Please never
> > do this.
> >
> 
> These two are both used by cdev_device_add(). Looks like I didn't find
> any problem. Any suggestions?

Make one of these dynamic and do not have them both control the lifespan
of the structure.

> > > +     struct vduse_virtqueue *vqs;
> > > +     struct vduse_iova_domain *domain;
> > > +     char *name;
> > > +     struct mutex lock;
> > > +     spinlock_t msg_lock;
> > > +     atomic64_t msg_unique;
> >
> > Why do you need an atomic and a lock?
> >
> 
> You are right. We don't need an atomic here.
> 
> > > +     wait_queue_head_t waitq;
> > > +     struct list_head send_list;
> > > +     struct list_head recv_list;
> > > +     struct list_head list;
> > > +     struct vdpa_callback config_cb;
> > > +     struct work_struct inject;
> > > +     spinlock_t irq_lock;
> > > +     unsigned long api_version;
> > > +     bool connected;
> > > +     int minor;
> > > +     u16 vq_size_max;
> > > +     u32 vq_num;
> > > +     u32 vq_align;
> > > +     u32 config_size;
> > > +     u32 device_id;
> > > +     u32 vendor_id;
> > > +};
> > > +
> > > +struct vduse_dev_msg {
> > > +     struct vduse_dev_request req;
> > > +     struct vduse_dev_response resp;
> > > +     struct list_head list;
> > > +     wait_queue_head_t waitq;
> > > +     bool completed;
> > > +};
> > > +
> > > +struct vduse_control {
> > > +     unsigned long api_version;
> >
> > u64?
> >
> 
> OK.
> 
> > > +};
> > > +
> > > +static unsigned long max_bounce_size = (64 * 1024 * 1024);
> > > +module_param(max_bounce_size, ulong, 0444);
> > > +MODULE_PARM_DESC(max_bounce_size, "Maximum bounce buffer size. (default: 64M)");
> > > +
> > > +static unsigned long max_iova_size = (128 * 1024 * 1024);
> > > +module_param(max_iova_size, ulong, 0444);
> > > +MODULE_PARM_DESC(max_iova_size, "Maximum iova space size (default: 128M)");
> > > +
> > > +static bool allow_unsafe_device_emulation;
> > > +module_param(allow_unsafe_device_emulation, bool, 0444);
> > > +MODULE_PARM_DESC(allow_unsafe_device_emulation, "Allow emulating unsafe device."
> > > +     " We must make sure the userspace device emulation process is trusted."
> > > +     " Otherwise, don't enable this option. (default: false)");
> > > +
> >
> > This is not the 1990's anymore, please never use module parameters, make
> > these per-device attributes if you really need them.
> >
> 
> These parameters will be used before the device is created. Or do you
> mean add some attributes to the control device?

You need to do something, as no one can mess with a module parameter
easily.  Why do you need them at all, shouldn't it "just work" properly
with no need for userspace interaction?

> > > +static int vduse_init(void)
> > > +{
> > > +     int ret;
> > > +
> > > +     if (max_bounce_size >= max_iova_size)
> > > +             return -EINVAL;
> > > +
> > > +     ret = misc_register(&vduse_misc);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     vduse_class = class_create(THIS_MODULE, "vduse");
> >
> > If you have a misc device, you do not need to create a class at the same
> > time.  Why are you doing both here?  Just stick with the misc device, no
> > need for anything else.
> >
> 
> The misc device is the control device represented by
> /dev/vduse/control. Then a VDUSE device represented by
> /dev/vduse/$NAME can be created by the ioctl(VDUSE_CREATE_DEV) on this
> control device.

Ah.  Then how about using the same MAJOR for all of these, and just have
the first minor (0) be your control?  That happens for other device
types (raw, loop, etc.).  Or just document this really well please, as
it was not obvious what you were doing here.

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
