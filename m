Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAFA3F5F98
	for <lists.iommu@lfdr.de>; Tue, 24 Aug 2021 15:56:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F2BA400FD;
	Tue, 24 Aug 2021 13:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fy_sYWew7i7p; Tue, 24 Aug 2021 13:56:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1BBF0400F2;
	Tue, 24 Aug 2021 13:56:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0693C001F;
	Tue, 24 Aug 2021 13:55:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93241C000E
 for <iommu@lists.linux-foundation.org>; Tue, 24 Aug 2021 13:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75E78606C8
 for <iommu@lists.linux-foundation.org>; Tue, 24 Aug 2021 13:55:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dUkSxN_ppgCi for <iommu@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 13:55:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9DCC60681
 for <iommu@lists.linux-foundation.org>; Tue, 24 Aug 2021 13:55:55 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id bb10so5528768vkb.9
 for <iommu@lists.linux-foundation.org>; Tue, 24 Aug 2021 06:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S8hP4pVddrWImbh6fCLaXB99hmcWtMRQBThCoTN0H6s=;
 b=CfVSKgVczCylLBy5TqKS/XrCB712GXP8szZzwa50NcU1BaazhOx10Yr2WGi1BFzw1x
 tSmBKFPWk3xPmvFr62IXZR67LlsE34TER+l7Fmlvf7LbaLsEVkTrLnzKzlHbNB9EYIOM
 LztCma8semPmKG1zjMgwhs9Bc/n156km5P2OyDA4oL6LW3wY5KB1qnrBBZ+raexl18iO
 D9oBfh4BQ5P5Xz0NfXpsLl1Q0xHJinTlF8GxYr857UPItp0Eh1ez7xa7nldUvKN8nhPK
 r4YvBPrzB+8AWZJVmAEWRC9p8ttheDlmGqcuFw5lFZDtqmJ9OCMUvMDqoo7QzOsJg0Uh
 5+FQ==
X-Gm-Message-State: AOAM532THJSbBEYjUdgrDC30aUwAhlQjc7a5LnxqkBcOdhFF52QX0cs1
 hdOaqXRrlBWKUNEsh3K8OZxVqgqUj46XLWR/nEA=
X-Google-Smtp-Source: ABdhPJwOAVxPzgJVnsFrTLNfWZ/oMMEIpSzQrTS/Wb0ggwHzX527BJKiGPZFrjZHNpbcPeMgxnT0ww/YoTKznMwX8xk=
X-Received: by 2002:ac5:c85c:: with SMTP id g28mr25592892vkm.5.1629813354638; 
 Tue, 24 Aug 2021 06:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <83672ee76f6405c82845a55c148fa836f56fbbc1.1629465282.git.robin.murphy@arm.com>
In-Reply-To: <83672ee76f6405c82845a55c148fa836f56fbbc1.1629465282.git.robin.murphy@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Aug 2021 15:55:43 +0200
Message-ID: <CAMuHMdXL7ZtY8kBx=RHsRy1JECsGPDe+E3SM=--w7bUHMYHFBQ@mail.gmail.com>
Subject: Re: [PATCH] iommu/io-pgtable: Abstract iommu_iotlb_gather access
To: Robin Murphy <robin.murphy@arm.com>
Cc: kernel test robot <lkp@intel.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

Hi Robin,

On Fri, Aug 20, 2021 at 3:22 PM Robin Murphy <robin.murphy@arm.com> wrote:
> Previously io-pgtable merely passed the iommu_iotlb_gather pointer
> through to helpers, but now it has grown its own direct dereference.
> This turns out to break the build for !IOMMU_API configs where the
> structure only has a dummy definition. It will probably also crash
> drivers who don't use the gather mechanism and simply pass in NULL.
>
> Wrap this dereference in a suitable helper which can both be stubbed
> out for !IOMMU_API and encapsulate a NULL check otherwise.
>
> Fixes: 7a7c5badf858 ("iommu: Indicate queued flushes via gather data")

Is this the right Fixes tag?

The build issue was introduced by:
Fixes: a8e5f04458c4e496 ("iommu/io-pgtable: Remove non-strict quirk")

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Thanks, this fixes the build issues I was seeing.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
