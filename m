Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B183C232049
	for <lists.iommu@lfdr.de>; Wed, 29 Jul 2020 16:26:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1837C87662;
	Wed, 29 Jul 2020 14:26:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wFYi3-2BXFWZ; Wed, 29 Jul 2020 14:26:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5BD72875C7;
	Wed, 29 Jul 2020 14:26:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5100EC004D;
	Wed, 29 Jul 2020 14:26:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 023C7C004D
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jul 2020 14:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E51F38502C
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jul 2020 14:26:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p-ydUZaX24Vs for <iommu@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 14:26:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C81BA85036
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jul 2020 14:26:43 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y3so21847900wrl.4
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jul 2020 07:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dy8KWXYTow5Rv/ocWI6NcoOurbpn5CoM2X7oqF6BBwc=;
 b=QmJ7s1Bm/VMGgvExl3jijvZ0ohCPoRnWqYNUcbqX2X++mJh+1jczZcgs7Y3nyrS1WU
 chFU3XTv1g/b/Pg3/n4Pr6ULcF0R8YoeqquXmUxHmEMPkXMvxotu8b7fgAlBfY0gSJqq
 +Ecuc9EPJXEn/D3CXcZueyzy8wr2xqcKQGKYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dy8KWXYTow5Rv/ocWI6NcoOurbpn5CoM2X7oqF6BBwc=;
 b=DxPZJ0/kJ4+hcUQ9mcL8/JOpSA3JbiJB3cTrR15rNYDCal7bdizVZN9rhFlxoJ3kj3
 fDkRUewiokzZACL40Wb4Qh0ZwGS6Bn3HfXOHAz819FQsVLziNKEAol3a7nZ0TaOswtmh
 eVJiRWrZ5Q9KYfnFUjfIHswvhMN4YlWEA7T7IWKRBAe5iLjQRNkDhIuDtvKL/PKsh5F1
 KhthQj+l6QDKjAVR+whsFSV+jyY+oYuWbyN3B8k6Dc5ouuo+3oN4cNBSeNdcV2pSSNzt
 v4kmbaSf8/lmbYVvL2gh0gsmNjtioXbezxTOcbnG4/2vrSKfqhLLt7MK1eIBvUw72Xdu
 2LCw==
X-Gm-Message-State: AOAM532REhGNxAGtLVya+9QVT5GphdweW50Z9Xs9E9oMUBfeReegnlpt
 fekEsLc4SbU+TrFbBZm+0CjdU86h59NZbnNj0X3axg==
X-Google-Smtp-Source: ABdhPJwwt8UrAlXwvkhdeyf8ibKzxRjk8LPYCRKGkcT48qYnyQotcCx0FHhfXS6w8sTit2G3tX8NQB2n4nyKOS9ipgI=
X-Received: by 2002:adf:9501:: with SMTP id 1mr22051008wrs.413.1596032801912; 
 Wed, 29 Jul 2020 07:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200724203407.16972-1-james.quinlan@broadcom.com>
 <20200724203407.16972-9-james.quinlan@broadcom.com>
 <CAL_Jsq+9QE_uz+81O-Bm3xycSrJptx0xmwpPdP3x65KG00ugDQ@mail.gmail.com>
 <CA+-6iNwD1ehy6LPJ6gZJjvVeTBXAG_ybhyfUHTCvsDnM-HnmXA@mail.gmail.com>
 <20200729061903.GA31671@lst.de>
In-Reply-To: <20200729061903.GA31671@lst.de>
Date: Wed, 29 Jul 2020 10:26:29 -0400
Message-ID: <CA+-6iNxW9=9ZEcspxvbf7F_n6g5CrEWmGh-cNcmC4BKdY0SMfA@mail.gmail.com>
Subject: Re: [PATCH v9 08/12] device core: Introduce DMA range map,
 supplanting dma_pfn_offset
To: Christoph Hellwig <hch@lst.de>
Cc: Rich Felker <dalias@libc.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 PCI <linux-pci@vger.kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Julien Grall <julien.grall@arm.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
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
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Yong Deng <yong.deng@magewell.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
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

On Wed, Jul 29, 2020 at 2:19 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Jul 28, 2020 at 02:24:51PM -0400, Jim Quinlan wrote:
> > I started using devm_kcalloc() but at least two reviewers convinced me
> > to just use kcalloc().  In addition, when I was using devm_kcalloc()
> > it was awkward because 'dev' is not available to this function.
> >
> > It comes down to whether unbind/binding the device N times is actually
> > a reasonable usage.  As for my experience I've seen two cases: (1) my
> > overnight "bind/unbind the PCIe RC driver" script, and we have a
> > customer who does an unbind/bind as a hail mary to bring back life to
> > their dead EP device.  If the latter case happens repeatedly, there
> > are bigger problems.
>
> We can't just leak the allocations.  Do you have a pointer to the
> arguments against managed resources?  I'm generally not a huge fan
> of the managed resources, but for a case like this they actually seem
> useful.  If we don't use the managed resources we'll at leat need
> to explicitly free the resources when freeing the device.

Actually, there were no arguments for using an unmanaged kcalloc, just
comments [1], [2].  When it was rightly suggested to have 'dev'
dropped from of_dma_range() [3], I submitted v6 to accomplish this.
But now of_dma_range() would call kcalloc(), and then
of_dma_configure() was required to "dup" the result, requiring a
devm_kcalloc(), memcpy(), and kfree().  This was awkward, so
considering [1], [2], I dropped the devm_kcalloc() and submitted v7.

So I can easily revert to the awkward code of v6.  But I'm hoping you
have a more elegant solution :-)

Thanks,
Jim

[1]
[v6, Andy Shevchenko]
> +             /* We want the offset map to be device-managed, so alloc & copy */
> +             dev->dma_range_map = devm_kcalloc(dev, num_ranges + 1, sizeof(*r),
> +                                               GFP_KERNEL);
The question is how many times per device lifetime this can be called?

[2]
[v2, Andy Shevchenko]
> +     r = devm_kzalloc(dev, r_size, GFP_KERNEL);
devm_?!
Looking at r_size it should be rather kcalloc().

[3]
[v3, Nicolas Saenz Julienne]
> I agree with you.  The reason I needed a "struct device *"  in the call is
> because I wanted to make sure the memory that is alloc'd belongs to the
> device that needs it.  If I do a regular kzalloc(), this memory  will become
> a leak once someone starts unbinding/binding their device.  Also, in  all
> uses of of_dma_rtange() -- there is only one --  a dev is required as one
> can't attach an offset map to NULL.
>
> I do see that there are a number of functions in drivers/of/*.c that
> take 'struct device *dev' as an argument so there is precedent for
> something like this.  Regardless, I need an owner to the memory I
> alloc().
I understand the need for dev to be around, devm_*() is key. But also it's
important to keep the functions on purpose. And if of_dma_get_range() starts
setting ranges it calls, for the very least, for a function rename. Although
I'd rather split the parsing and setting of ranges as mentioned earlier. That
said, I get that's a more drastic move.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
