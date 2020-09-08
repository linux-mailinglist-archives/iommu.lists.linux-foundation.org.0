Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E532F261401
	for <lists.iommu@lfdr.de>; Tue,  8 Sep 2020 17:59:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9EC8787323;
	Tue,  8 Sep 2020 15:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hOiuPbHe5x59; Tue,  8 Sep 2020 15:59:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1685A8731D;
	Tue,  8 Sep 2020 15:59:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC91EC0051;
	Tue,  8 Sep 2020 15:59:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A2FEC0051
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 15:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7B4A72DDC9
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 15:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Irb0IfPtZVjx for <iommu@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 15:59:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 011242D47F
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 15:59:31 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id l9so17708929wme.3
 for <iommu@lists.linux-foundation.org>; Tue, 08 Sep 2020 08:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vFCX2Fx3/ZhVK+MHCzMslsFFLX+ZTpr5SFfq/bucSTE=;
 b=L5de6DTjHrhWW1tiuojsLRMbF1lQE8xkIQS2sgiAFfGUDk0a4nZGsy6DA9vpTUVrVD
 TWVAYMaDdAikQ0XGrZ1rPYMiKq3E7QNXbmvaNEIuDe/676WFyyXuw8aAeCfxKpNvmcIR
 oOMvGXhP0YdPyjRGvHhGSzPFVfvoPyjAc9RkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vFCX2Fx3/ZhVK+MHCzMslsFFLX+ZTpr5SFfq/bucSTE=;
 b=d9m4zQl43rbdZCbs2pxJHw3LnFDUxsE93xeRgiym/UJWLZGaVLfA1kTuLJiSYZ3VuZ
 oG/Jrtq35h3AAOJdClTFoh1mjDt5bfjXaPw1oKdSnVwvy9i8mSGw/+OYUgWEmR8Y/RRx
 lso/iJR1LAzkL7TAfooMKjSuQlMQMtWnQ9WLtvwe+2oX7AMeXUq8Or3HoFJQ19ysOj6A
 bASTmoMF4pMVPjZoSca3Ra0BP+Q6FucdS0y+MdbWxDu4epfOKXF0XMgh4IhDfqyCwjVB
 hR7H6Mp1dh/gr0BrfsGzoEnhMVPtYqJ2/G0PvkFgl7O6qRTce+7aMnWq0QSBJmOkHBsO
 KABw==
X-Gm-Message-State: AOAM531tJ2H23u2CDm3W4rxHRDvRk64jyXbS9ugUgYhe2D3jtKyMPAXM
 oUyNr85fHwXSYx+lj4wAw1pitlTRwZ4xTKpfX0/XGw==
X-Google-Smtp-Source: ABdhPJwa1zAsXIysL/taf1Rf3+uFmxTFm5hzgWcGRQOlEC+E6qstK5Gdi4LiSkkqsjOISYSAvkgu7aDZT9q2XbYuB4E=
X-Received: by 2002:a1c:bad5:: with SMTP id k204mr192855wmf.111.1599580770266; 
 Tue, 08 Sep 2020 08:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <CA+-6iNzc38OAL7TGxobpODKXOD1CW-VFNU0rK9Z043QfR3MfsQ@mail.gmail.com>
 <20200902223852.GA1786990@ubuntu-n2-xlarge-x86>
 <6922bc0b-1849-2f2f-ec2f-fe9f0124dcfc@gmail.com>
 <20200903005240.GA1118@Ryzen-9-3900X.localdomain>
 <CA+-6iNyv_sFJOxDi5OcYNWe=ovLnOnrZNsWFQk5b-bzQzA8T_Q@mail.gmail.com>
 <34aa0d6094e7d6fb3492d2cda0fec8ecc04790ed.camel@suse.de>
 <CA+-6iNyJ3ey0zPKj9nh8uL3AwTBhJqgD01wc=7G4NF35NXmV1Q@mail.gmail.com>
 <b4761ade39af346eebec917ca2a415c09681542a.camel@suse.de>
 <20200908072935.GA15119@lst.de>
 <20200908073203.GA15176@lst.de> <20200908094345.GA20959@lst.de>
In-Reply-To: <20200908094345.GA20959@lst.de>
Date: Tue, 8 Sep 2020 11:59:18 -0400
Message-ID: <CA+-6iNwsLgpPG+-A8gnrnWxPZuc932PgF_L0ByRQjGz_0=bsbQ@mail.gmail.com>
Subject: Re: [PATCH v11 07/11] device-mapping: Introduce DMA range map,
 supplanting dma_pfn_offset
To: Christoph Hellwig <hch@lst.de>
Cc: Rich Felker <dalias@libc.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:ACPI FOR ARM64 ACPI/arm64" <linux-acpi@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Yong Deng <yong.deng@magewell.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 open list <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
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
From: Jim Quinlan via iommu <iommu@lists.linux-foundation.org>
Reply-To: Jim Quinlan <james.quinlan@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Sep 8, 2020 at 5:43 AM Christoph Hellwig <hch@lst.de> wrote:
>
> And because I like replying to myself so much, here is a link to the
> version with the arm cleanup patch applied.  Unlike the previous two
> attempts this has at least survived very basic sanity testing:
>
> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-ranges.2
>
Tested-by: Jim Quinlan <james.quinlan@broadcom.com>

> Note that we'll still need to sort out the arm/keystone warnings from
> the original patch.  Do we have anyone on the CC list who knows that
> platform a little better to figure out if the ifdef solution would work?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
