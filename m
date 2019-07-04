Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3845F95C
	for <lists.iommu@lfdr.de>; Thu,  4 Jul 2019 15:51:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4DE331155;
	Thu,  4 Jul 2019 13:51:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4BAA5B62
	for <iommu@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 13:51:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 73D2C882
	for <iommu@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 13:51:41 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id d4so5478776edr.13
	for <iommu@lists.linux-foundation.org>;
	Thu, 04 Jul 2019 06:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=B2NJUH3gYGgBtbx3WN1Ity0pDWugJQ7jF9R1ADUX4lk=;
	b=hmowFyFGkwXbEFC/kyfNcBrt9V9cHjiQIm+Z0EQg+YQlW5rfQRBhO6IWD/BOPARcU8
	ejkMVH9q8Bv/mYnS9q+JYZEaMW6sagrnojzOC/UCdqT3UYZIjmJv7Ok7r+uMy0DWvY2q
	G5LjM3qwC79ZEsjXxJ0NSXeUDTWElwdMq1sg4TDlJPFAn7vz9L3Kwr5DLPndWA2aCO4w
	IB/oKVx3QJxAdG6Tq411VPBtbkIiFTSiT3hkWex2/NgQhoJVAqWD0dH+LHbaf/Tbrcbx
	1M15JCpoSLDBP5ASs7mwSbbI91QiAFOyTYcOBf7okxvzYFcPQesKfXn0kM/zjR+Jzwwq
	DICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=B2NJUH3gYGgBtbx3WN1Ity0pDWugJQ7jF9R1ADUX4lk=;
	b=F3qpqZR7yAUAUvHBpaPYr4q6VEiATjGUh+3Zw0ffpry8yzYWuKgkcCbmfmBhEdknPX
	yXYMohkLrIp4+lEDZYx9/KR+bmGtLiyqvSs2EKqhs77SNYkk468Whtc5jx+bQffovZGJ
	q2tkzMQeMr4dwCv1pzwhriTE/3ltc+zQ9VhGmwQKv0PZMSAPKvinSzSl2uA3v2hGOZGr
	w/FxmvzX9qK55a/mwoMyniy3hb9D8//44rYy81cMqAE4rLx2uk58hwjM/oz9XH2d1ETH
	NCGiIruB337STqqBZu09jQhH0Ix1RyGPaMDRRCusjfcSK+6dEVhsKVOsX4eTy4At3gWc
	+OvA==
X-Gm-Message-State: APjAAAV9GFly7RqXiFRUXFWdYpk0yZwqLDoVLivUrHL/yrTv8MFzbuFM
	hHoLJVBVsNf8uzHnAG4m6R47fGjT/r5CJ7dF1sg=
X-Google-Smtp-Source: APXvYqy0BJY/7zHhJ8fIDLe2X+6WEGO81pJJSvAlHI679eDU3T2nzWxvLXnNB4Rdv1E6hpJcX38qgxrxWALFF2nDlLo=
X-Received: by 2002:a17:906:6802:: with SMTP id
	k2mr14814143ejr.174.1562248299953; 
	Thu, 04 Jul 2019 06:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190702202631.32148-1-robdclark@gmail.com>
	<20190702202631.32148-2-robdclark@gmail.com>
	<20190704082001.GD6546@8bytes.org>
In-Reply-To: <20190704082001.GD6546@8bytes.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 4 Jul 2019 06:51:23 -0700
Message-ID: <CAF6AEGtjMqoFprY+r6zwUxxpm9iFfN-n-uNad3w9vxOCcTrQJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu: add support for drivers that manage iommu
	explicitly
To: Joerg Roedel <joro@8bytes.org>
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
	dri-devel <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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

On Thu, Jul 4, 2019 at 1:20 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> Hi Rob,
>
> On Tue, Jul 02, 2019 at 01:26:18PM -0700, Rob Clark wrote:
> > 1) In some cases the bootloader takes the iommu out of bypass and
> >    enables the display.  This is in particular a problem on the aarch64
> >    laptops that exist these days, and modern snapdragon android devices.
> >    (Older devices also enabled the display in bootloader but did not
> >    take the iommu out of bypass.)  Attaching a DMA or IDENTITY domain
> >    while scanout is active, before the driver has a chance to intervene,
> >    makes things go *boom*
>
> Just to make sure I get this right: The bootloader inializes the SMMU
> and creates non-identity mappings for the GPU? And when the SMMU driver
> in Linux takes over this breaks display output.

correct

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
> > +
>
> When the default domain is attached, there is usually no driver attached
> yet. I think this needs to be communicated by the firmware to Linux and
> the code should check against that.

At least for the OF case, it happens in the of_dma_configure() which
happens from really_probe(), so there is normally a driver.  There are
a few exceptional cases, where drivers call of_dma_configure() on
their own sub-device without a driver attached (hence the need to
check if dev->driver is NULL).

I'm also interested in the ACPI case eventually... the aarch64
"windows" laptops do have ACPI.  But for now we are booting with DT
since there is quite a lot of work before we get to point of using
ACPI.  (In particular, under windows, device power management is done
thru a Platform Extension  Plugin (PEP), but so far linux has no such
mechanism.)

We really don't have control of the firmware.  But when arm-smmu is
probed it can read back the hw state and figure out what is going on
(with an RFC series[1] from Bjorn which was posted earlier), so we
don't really need to depend on the firmware.

> > -     bool suppress_bind_attrs;       /* disables bind/unbind via sysfs */
> > +     bool suppress_bind_attrs:1;     /* disables bind/unbind via sysfs */
> > +     bool driver_manages_iommu:1;    /* driver manages IOMMU explicitly */
>
> How does this field get set?


It is set in the driver in the second patch[2] in this series.

BR,
-R

[1] https://www.spinics.net/lists/arm-kernel/msg732246.html
[2] https://patchwork.freedesktop.org/patch/315291/
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
