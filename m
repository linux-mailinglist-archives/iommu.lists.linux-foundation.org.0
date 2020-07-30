Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BD1233700
	for <lists.iommu@lfdr.de>; Thu, 30 Jul 2020 18:44:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 953C28849F;
	Thu, 30 Jul 2020 16:44:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kjxhR5lnun46; Thu, 30 Jul 2020 16:44:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0169588484;
	Thu, 30 Jul 2020 16:44:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6E89C004D;
	Thu, 30 Jul 2020 16:44:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6221AC004D
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jul 2020 16:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 479CF20533
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jul 2020 16:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RIwZdWPlKBMb for <iommu@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 16:44:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 29C0420504
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jul 2020 16:44:48 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id k8so6835284wma.2
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jul 2020 09:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/WGqCOKip3V4asdK4kVZSLuOUEeNBpSCyttBdQXrjyQ=;
 b=RY2n6Td8Tl0tSuExkUbQNpMfcpseBvpu8JkBMp0qVCS5WE6XZPG7426ps4Fr6bN4L8
 zoDJUkr0PIub4rwTuXkmHKJzE2kpPwn9jnoTowyaVoH/1cm4aqdhst+ZgjlGuhEzlf+v
 xahAZmxSN1q5k/z2rddgAhGICd1umbYqK70Yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/WGqCOKip3V4asdK4kVZSLuOUEeNBpSCyttBdQXrjyQ=;
 b=sgLLUBKzZPwI3tWZRvXQm3HfZCt0SCoPg8CNaoN/1FLvl91Syj4c5pzRqAMRHVzIOA
 le2oHpOlqFlBmzCnB/1TAaRcQ48H2Qn7DfRwlXJjMm8KOFXt6mg9b1m8vgI5lSVPBJdm
 aQz6tVeRfUIRixjtvGgoE6d7JqmvxhbB/4tfbgXW7sQjmRrddnvkPoBjIq5oYAeUZ/7F
 l/YIPl8EdwhupmHLYwUcDkEvj90tBsUQsPnQN0TKOtJw+XetXmhwJhKxiba8lMvPmgkk
 JkQ+aebJeQflHP1u1AIdkV6Y8Fjq8oaIARXc4riulWS8j5OztP8kTAfp2JBSQm6IleNF
 i6Tg==
X-Gm-Message-State: AOAM530tMTDe9al6zZc75dWexA8qJ0nj9I/jMEdhOJGcQtNgNMsQsd1i
 Ziz7uSuZ2zAMZW3pQC1k+kIqQLeplzR6SWdXGZMrhw==
X-Google-Smtp-Source: ABdhPJzPN/Gtn3yixsdd2Lbzp2FrZ7CbcVWH5kFgwvDKBPGWoM/jJv19H1hiW66ZlUHk1XI9xqRJk738HXFPzQ3IVyA=
X-Received: by 2002:a1c:5459:: with SMTP id p25mr121162wmi.85.1596127486364;
 Thu, 30 Jul 2020 09:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200724203407.16972-1-james.quinlan@broadcom.com>
 <20200724203407.16972-9-james.quinlan@broadcom.com>
 <CAL_Jsq+9QE_uz+81O-Bm3xycSrJptx0xmwpPdP3x65KG00ugDQ@mail.gmail.com>
 <CA+-6iNwD1ehy6LPJ6gZJjvVeTBXAG_ybhyfUHTCvsDnM-HnmXA@mail.gmail.com>
 <20200729061903.GA31671@lst.de>
 <CAL_JsqLL_ZZFwinJpveybAtHg9KtrYCHgM3gNHero+Xujyd2eg@mail.gmail.com>
In-Reply-To: <CAL_JsqLL_ZZFwinJpveybAtHg9KtrYCHgM3gNHero+Xujyd2eg@mail.gmail.com>
Date: Thu, 30 Jul 2020 12:44:33 -0400
Message-ID: <CA+-6iNyi4c+ZUZhe=Zn5qX5GiGQVLR+BOcXmXSJkooX=S9=C0A@mail.gmail.com>
Subject: Re: [PATCH v9 08/12] device core: Introduce DMA range map,
 supplanting dma_pfn_offset
To: Rob Herring <robh+dt@kernel.org>
Cc: Rich Felker <dalias@libc.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 PCI <linux-pci@vger.kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Julien Grall <julien.grall@arm.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Frank Rowand <frowand.list@gmail.com>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:ACPI FOR ARM64 \(ACPI/arm64\)" <linux-acpi@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Borislav Petkov <bp@alien8.de>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Yong Deng <yong.deng@magewell.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 open list <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>
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

On Wed, Jul 29, 2020 at 10:28 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Wed, Jul 29, 2020 at 12:19 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Tue, Jul 28, 2020 at 02:24:51PM -0400, Jim Quinlan wrote:
> > > I started using devm_kcalloc() but at least two reviewers convinced me
> > > to just use kcalloc().  In addition, when I was using devm_kcalloc()
> > > it was awkward because 'dev' is not available to this function.
> > >
> > > It comes down to whether unbind/binding the device N times is actually
> > > a reasonable usage.  As for my experience I've seen two cases: (1) my
> > > overnight "bind/unbind the PCIe RC driver" script, and we have a
> > > customer who does an unbind/bind as a hail mary to bring back life to
> > > their dead EP device.  If the latter case happens repeatedly, there
> > > are bigger problems.
> >
> > We can't just leak the allocations.  Do you have a pointer to the
> > arguments against managed resources?  I'm generally not a huge fan
> > of the managed resources, but for a case like this they actually seem
> > useful.  If we don't use the managed resources we'll at leat need
> > to explicitly free the resources when freeing the device.
>
> The lifetime for devm_kcalloc may not be what we want here. devm
> allocs are freed on probe fail or remove, not on freeing the device
> (there is a just in case free there too though).

What do you suggest doing as an alternative?

Jim
>
>
> Rob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
