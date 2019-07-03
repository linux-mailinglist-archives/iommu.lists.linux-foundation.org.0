Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A73F15E664
	for <lists.iommu@lfdr.de>; Wed,  3 Jul 2019 16:19:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 569FF1079;
	Wed,  3 Jul 2019 14:19:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C6BBB103C
	for <iommu@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 14:18:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0F53B898
	for <iommu@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 14:18:26 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id i11so2282088edq.0
	for <iommu@lists.linux-foundation.org>;
	Wed, 03 Jul 2019 07:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8yk0cmMEv+0MRszdLD3dUEUWJ8XlSxTYFd0KIq4hn+w=;
	b=VBVktxWHDr/tcb4xMnf3yUMnjauIkACQ8w4TsjDkKJA0yHi/rKxm04J42qgrHUDJ6m
	2kGNQFeB3/8j0J1I380Caebl4y9dHK7AQfbdoBEmzVtuWOVL67qlrULGwtq8L83HgU23
	0/R+pMDqzoGh71vihJQaxt21fKME6ffuSsFp0FZe8TLhxHM2JqWFJMbua6tAoWhVjVag
	yZqZPY1QZDiQiq9jDz4QQmUa7Qqv6fGCuJMOXA8Myl0lgeEyT7jwxAGisrfHJpwUWFZr
	Dg9jDaQ4l70Wdy+/P83ey9vaYwwF33B+ljifhDqV33Jwe51HrJtZ/Ab5662GBfGHTPnf
	1W8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8yk0cmMEv+0MRszdLD3dUEUWJ8XlSxTYFd0KIq4hn+w=;
	b=ICv0dWAvFf8RHVIN2gbP6PNwUBcYiu1XWiXoSoKlNVzRT9B7ObjZPsmVyUxDc1uQYr
	yBLC6MwCrKPmq3g8RxZpWK2rW3pha2n2Bjz2RgVoXPEoBZvLVUNXC5Om1PeSSP4Es3vj
	40EcKozoGC1cxbc7BIL49HB/T5VSfsqiEYMgfY/R85ff6eFBpvteTxcjlH79NegVgiKT
	3UbNIEMkbOit2I178IpSEmOvVnnLTBHwhLqmKA22gAl+3AVjWGrScbaXpp5O0UQ/fQqA
	/4O7+RQFJkX92wcvyHTtwPTAS7ynyNX37mFECeJdsbVYcPax0u9fGkJARCfsvaa7wKmn
	GAPw==
X-Gm-Message-State: APjAAAWrkNWgdQfyGZcWoqew5MeaGZF5ERbrjX4S6LePuE731oWWwcOd
	q7sdoxZahJHm/2pKw82HwHsggR9J0zyBwCFtv6w=
X-Google-Smtp-Source: APXvYqx0+oVtdHnixNwuU8fi/y+kTfkvf4ofilsk/qeaDhAQAHX/OpYwYivYh196b63WJsMfSphgpalrxzaAtAr6VTA=
X-Received: by 2002:a50:9468:: with SMTP id q37mr42530358eda.163.1562163505578;
	Wed, 03 Jul 2019 07:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190702202631.32148-1-robdclark@gmail.com>
	<20190702202631.32148-2-robdclark@gmail.com>
	<2d612bbc-2d2d-f718-1499-79d5a55e0d00@arm.com>
In-Reply-To: <2d612bbc-2d2d-f718-1499-79d5a55e0d00@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 3 Jul 2019 07:18:09 -0700
Message-ID: <CAF6AEGvp1yUquP2JnSWuOSpVscj+BXqkuK+7bHmAKuL3LL2ZaQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu: add support for drivers that manage iommu
	explicitly
To: Robin Murphy <robin.murphy@arm.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	"list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
	Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Joe Perches <joe@perches.com>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>
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

On Wed, Jul 3, 2019 at 5:42 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 02/07/2019 21:26, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Avoid attaching any non-driver managed domain if the driver indicates
> > that it manages the iommu directly.
> >
> > This solves a couple problems that drm/msm + arm-smmu has with the iommu
> > framework:
> >
> > 1) In some cases the bootloader takes the iommu out of bypass and
> >     enables the display.  This is in particular a problem on the aarch64
> >     laptops that exist these days, and modern snapdragon android devices.
> >     (Older devices also enabled the display in bootloader but did not
> >     take the iommu out of bypass.)  Attaching a DMA or IDENTITY domain
> >     while scanout is active, before the driver has a chance to intervene,
> >     makes things go *boom*
>
> In the general case, we have to assume that things already went boom
> long ago, as soon as the IOMMU itself was probed and reset. By the time
> we get to the point of binding of a client driver, also assume that the
> IOMMU is already powered off and stopping traffic because the RPM device
> links aren't in place yet and it believes itself unused.

you are correct that this is only part of what is needed to get things
working.  We also need Bjorn's patch set to inherit SMR and CB config
during init:

https://www.spinics.net/lists/arm-kernel/msg732246.html

>
> > 2) We are currently blocked on landing support for GPU per-context
> >     pagetables because of the domain attached before driver's ->probe()
> >     is called.
>
> I'm getting a little fed up of explaining that that problem is specific
> to the current behaviour of one particular IOMMU driver and trying to
> work around it anywhere other than in that driver is at best an
> unreliable hack.

Perhaps the GPU part of the problem.  The display part is not.
However I'm fine to move the "don't actually attach" part into
arm-smmu if that is preferred.  The next person to hit the same
problem on a different iommu could certainly move the check or copy it
into their iommu driver.

> > This solves both problems.
>
> For a very, very specific value of "solve"... ;)

well, "solve" == "it boots fine and doesn't explode"..

I'm certainly happy to entertain alternative suggestions, but these
are real problems that need solutions.

BR,
-R

> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/iommu/iommu.c  | 11 +++++++++++
> >   include/linux/device.h |  3 ++-
> >   2 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > index 0c674d80c37f..efa0957f9772 100644
> > --- a/drivers/iommu/iommu.c
> > +++ b/drivers/iommu/iommu.c
> > @@ -1573,6 +1573,17 @@ static int __iommu_attach_device(struct iommu_domain *domain,
> >           domain->ops->is_attach_deferred(domain, dev))
> >               return 0;
> >
> > +     /*
> > +      * If driver is going to manage iommu directly, then avoid
> > +      * attaching any non driver managed domain.  There could
> > +      * be already active dma underway (ie. scanout in case of
> > +      * bootloader enabled display), and interfering with that
> > +      * will make things go *boom*
> > +      */
> > +     if ((domain->type != IOMMU_DOMAIN_UNMANAGED) &&
> > +         dev->driver && dev->driver->driver_manages_iommu)
> > +             return 0;
>
> This leaving things half-hanging is really ugly, but more than that it
> assumes that allocating a default domain in the first place isn't
> disruptive - I'm not 100% sure that's *always* the case today, and it's
> definitely likely to change in future as part of improving the current
> request_dm_for_dev() mechanism. As it happens, those proposed changes
> would not only break this idea, but make it redundant, since they're
> about forcing the default domain type to passthrough on a per-device
> basis, which leads to an equivalent end result to this patch, but in a
> cleaner and more robust manner.
>
> Robin.
>
> > +
> >       if (unlikely(domain->ops->attach_dev == NULL))
> >               return -ENODEV;
> >
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index e138baabe01e..d98aa4d3c8c3 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -282,7 +282,8 @@ struct device_driver {
> >       struct module           *owner;
> >       const char              *mod_name;      /* used for built-in modules */
> >
> > -     bool suppress_bind_attrs;       /* disables bind/unbind via sysfs */
> > +     bool suppress_bind_attrs:1;     /* disables bind/unbind via sysfs */
> > +     bool driver_manages_iommu:1;    /* driver manages IOMMU explicitly */
> >       enum probe_type probe_type;
> >
> >       const struct of_device_id       *of_match_table;
> >
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
