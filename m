Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C4E2347AD
	for <lists.iommu@lfdr.de>; Fri, 31 Jul 2020 16:23:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BB51888789;
	Fri, 31 Jul 2020 14:23:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQJT3ltHv5eJ; Fri, 31 Jul 2020 14:23:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2A35B88790;
	Fri, 31 Jul 2020 14:23:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09599C004D;
	Fri, 31 Jul 2020 14:23:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A857C004D
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jul 2020 14:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 51D4B85FDE
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jul 2020 14:23:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HjtXoyLkIcey for <iommu@lists.linux-foundation.org>;
 Fri, 31 Jul 2020 14:23:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3215785E6F
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jul 2020 14:23:52 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E66C222D2A
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jul 2020 14:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596205432;
 bh=p6Dyfo2urJO4AhbyumMGMhFkpTQ7ortakkUGpTrUpmQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SO5Az25CevLmfcenbN2c7sl6b6bmuFxDrbUgyN0CyQoiqqjwbDK/k32lbmpUiBt0s
 IQIcX5y+uC4L3wjkyt2cclp61d6Ebt13/K3jEBgB1lh1O6bDDbJGlzd7cZqIN9QcAS
 jBqyu1DxeQzHV7JAR8HtfaYIfAsfk1vDM96jC7+o=
Received: by mail-yb1-f171.google.com with SMTP id y17so16298580ybm.12
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jul 2020 07:23:51 -0700 (PDT)
X-Gm-Message-State: AOAM532VwRMsFcQIJAbGLJK4bZ5AIMtnbFiCIfWZzo3DkFmo5F+2GbDP
 IIBNAoYNZ/bRJHZTSOifePI1kLOPEagZr00JZQ==
X-Google-Smtp-Source: ABdhPJyKOAtr6VPGSPomkdltpSsLr5l7uePcUajkE/DQZzP1vNdcO1EO/U2cbsU8VZIKN9wGPlt25OG9uNG86TDPGSk=
X-Received: by 2002:a9d:46c:: with SMTP id 99mr3203799otc.192.1596205429361;
 Fri, 31 Jul 2020 07:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200724203407.16972-1-james.quinlan@broadcom.com>
 <20200724203407.16972-9-james.quinlan@broadcom.com>
 <CAL_Jsq+9QE_uz+81O-Bm3xycSrJptx0xmwpPdP3x65KG00ugDQ@mail.gmail.com>
 <CA+-6iNwD1ehy6LPJ6gZJjvVeTBXAG_ybhyfUHTCvsDnM-HnmXA@mail.gmail.com>
 <20200729061903.GA31671@lst.de>
 <CAL_JsqLL_ZZFwinJpveybAtHg9KtrYCHgM3gNHero+Xujyd2eg@mail.gmail.com>
 <CA+-6iNyi4c+ZUZhe=Zn5qX5GiGQVLR+BOcXmXSJkooX=S9=C0A@mail.gmail.com>
In-Reply-To: <CA+-6iNyi4c+ZUZhe=Zn5qX5GiGQVLR+BOcXmXSJkooX=S9=C0A@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Jul 2020 08:23:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL5fgdnX+mkR4=BZJJ=rw79HN5vTZkmeZtUHq-Xw3uNdA@mail.gmail.com>
Message-ID: <CAL_JsqL5fgdnX+mkR4=BZJJ=rw79HN5vTZkmeZtUHq-Xw3uNdA@mail.gmail.com>
Subject: Re: [PATCH v9 08/12] device core: Introduce DMA range map,
 supplanting dma_pfn_offset
To: Jim Quinlan <james.quinlan@broadcom.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Thu, Jul 30, 2020 at 10:44 AM Jim Quinlan <james.quinlan@broadcom.com> wrote:
>
> On Wed, Jul 29, 2020 at 10:28 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Wed, Jul 29, 2020 at 12:19 AM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > On Tue, Jul 28, 2020 at 02:24:51PM -0400, Jim Quinlan wrote:
> > > > I started using devm_kcalloc() but at least two reviewers convinced me
> > > > to just use kcalloc().  In addition, when I was using devm_kcalloc()
> > > > it was awkward because 'dev' is not available to this function.
> > > >
> > > > It comes down to whether unbind/binding the device N times is actually
> > > > a reasonable usage.  As for my experience I've seen two cases: (1) my
> > > > overnight "bind/unbind the PCIe RC driver" script, and we have a
> > > > customer who does an unbind/bind as a hail mary to bring back life to
> > > > their dead EP device.  If the latter case happens repeatedly, there
> > > > are bigger problems.
> > >
> > > We can't just leak the allocations.  Do you have a pointer to the
> > > arguments against managed resources?  I'm generally not a huge fan
> > > of the managed resources, but for a case like this they actually seem
> > > useful.  If we don't use the managed resources we'll at leat need
> > > to explicitly free the resources when freeing the device.
> >
> > The lifetime for devm_kcalloc may not be what we want here. devm
> > allocs are freed on probe fail or remove, not on freeing the device
> > (there is a just in case free there too though).
>
> What do you suggest doing as an alternative?

I believe I gave it already. Put a kfree in the struct device release
function. But you can't be passing the pointer from device to device
if you go that route. You'd have to either copy the struct or check if
it's the same as the parent's and skip the kfree in that case.

Rob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
