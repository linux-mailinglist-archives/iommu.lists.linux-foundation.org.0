Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 970217040E
	for <lists.iommu@lfdr.de>; Mon, 22 Jul 2019 17:41:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1753DD81;
	Mon, 22 Jul 2019 15:41:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7E3B3CC9
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 15:41:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 392B4775
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 15:41:47 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id m10so41022850edv.6
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 08:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gbhi3M6mI+4oCuQkiXeYBwKqa8lehAmY1ApNgOUqhwo=;
	b=oq1L146UMTM5yp1F87M46OMRVNjVPxNYCqBgriKVv6dMDXX08s6uRiySQkE09kcK1A
	Ra2YvaKODVmITKUqtD7D1ZZBRTfaE2EIyiEpJokB2G8dfoqP1hIzdCqNe2owW2cN7JpK
	/zkAUcT1M6a8ckcpVXXe7ckudGM6GLl5YeRMMzlKGUi8Cgv8GgmvLGEpveZ4wCxnc3C4
	GLJFTrJWuI6GKBiuXFR8rfOXC8m6Lg7NcV5ejYFsiYQ+u0UPXpfbJ566t2UX28hlymTM
	STU8X04EdUcw3iu9gaHq2Zbbe4WfrqN3U1tyLEkqb89i0xg7+i4TO2G0kFl8exgLi//U
	0Dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gbhi3M6mI+4oCuQkiXeYBwKqa8lehAmY1ApNgOUqhwo=;
	b=C9CkX5IR/x6+AFc8wiVvfAcgUJ59IL92li3WNXE/uXdNZNYz12gOc5mtowSyONEqCR
	lngVN4SrWKgkIcjF/L8sUEoQR683bgIKtKTpty7ECapVlnMFuKcmGblF04MLcQzBXvLc
	mJ0/DPWXvZbrPq46/c4vjoJkDLOpeIxu/MQflIlunzIy8wHbJC9F8+9W2ouXJk2bAXoC
	zY4Jcsxx6QCMEGg194cwmbuT1FtzMBlSYUrUeC/NIeGFF/sWIn61BB5yvbQ2bSfll0Ju
	KmqgERBvMMgm+uV87qGKUojuaEYn0faDs0WkliIUJqEhvtVSaQW2QcnJ3bLVOSQRXFVc
	Yyig==
X-Gm-Message-State: APjAAAXPpH4jZXn68FqIfzjPQ7CS/yCdoczKO9vOKAG96H67JIBcmHGX
	uCWvEiKSVscuEQHdublPbAgVRn9ouiiUvI4WR4w=
X-Google-Smtp-Source: APXvYqxAGVaQMLs79f0ezsPQ6fjGuLy15ZNhz+Hy27pbz3hAzVegkYLJIcY3Cz+18kjo6Re9A52+O183SrZvHqwPE8o=
X-Received: by 2002:a50:8bfd:: with SMTP id n58mr60475682edn.272.1563810105719;
	Mon, 22 Jul 2019 08:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190702202631.32148-2-robdclark@gmail.com>
	<20190710182844.25032-1-robdclark@gmail.com>
	<20190722142833.GB12009@8bytes.org>
In-Reply-To: <20190722142833.GB12009@8bytes.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 22 Jul 2019 08:41:34 -0700
Message-ID: <CAF6AEGvJc2RK3GkpcXiVKsuTX81D3oahnu=qWJ9LFst1eT3tMg@mail.gmail.com>
Subject: Re: [PATCH v2] iommu: add support for drivers that manage iommu
	explicitly
To: Joerg Roedel <joro@8bytes.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Robin Murphy <robin.murphy@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
	"list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
	Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
	Will Deacon <will@kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
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

On Mon, Jul 22, 2019 at 7:28 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> On Wed, Jul 10, 2019 at 11:28:30AM -0700, Rob Clark wrote:
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -282,7 +282,8 @@ struct device_driver {
> >       struct module           *owner;
> >       const char              *mod_name;      /* used for built-in modules */
> >
> > -     bool suppress_bind_attrs;       /* disables bind/unbind via sysfs */
> > +     bool suppress_bind_attrs:1;     /* disables bind/unbind via sysfs */
> > +     bool driver_manages_iommu:1;    /* driver manages IOMMU explicitly */
>
> Who will set this bit?
>

It is set by the driver:

https://patchwork.freedesktop.org/patch/315291/

(This doesn't really belong in devicetree, since it isn't a
description of the hardware, so the driver is really the only place to
set this.. which is fine because it is about a detail of how the
driver works.)

BR,
-R
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
