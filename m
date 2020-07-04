Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 804D82153AF
	for <lists.iommu@lfdr.de>; Mon,  6 Jul 2020 10:05:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EAB0F86D2B;
	Mon,  6 Jul 2020 08:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hJe3Qar3ydDr; Mon,  6 Jul 2020 08:05:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8E81586D37;
	Mon,  6 Jul 2020 08:05:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 794BCC016F;
	Mon,  6 Jul 2020 08:05:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CFF8C0733
 for <iommu@lists.linux-foundation.org>; Sat,  4 Jul 2020 13:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 35B4188212
 for <iommu@lists.linux-foundation.org>; Sat,  4 Jul 2020 13:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sVtUeeM3UKW0 for <iommu@lists.linux-foundation.org>;
 Sat,  4 Jul 2020 13:20:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CC6B688209
 for <iommu@lists.linux-foundation.org>; Sat,  4 Jul 2020 13:20:41 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id w6so37316071ejq.6
 for <iommu@lists.linux-foundation.org>; Sat, 04 Jul 2020 06:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FxeWfdeiZs/rAf+ljgMaCrJoKxPAwF3x7YpavGdK0aI=;
 b=k0AQLqmBs39X8hgGcZfrSBkkff33qKuj+PAa3/3V65/noDmQ9W9gBdNBEIm3GAiYWG
 K6z6S2fEzf0frf6VKldY8Gd2e3labO3XqPacm0GwJL0ye56QlNoLrQvh71TI/xADk4Uh
 ZkXB8LqAQ2QGY5G8fXCYj2K/pROMoNUc2tXHyIV+em8G8bX4fkC8m+EBzByr/hRBUdQc
 RkNjsKRyV9TcZLk3EruvbcRuMlkJxEtQ34ZyIW5oxcPuvABduPtZpncxH7AvHqQCOqBX
 JCEH2AQ0xqWNz0m0odvp1ziGDp9a0jNHZZakGHeTRWpHkhw8Wlo3hjBRgnzW4nZOzCKk
 AK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FxeWfdeiZs/rAf+ljgMaCrJoKxPAwF3x7YpavGdK0aI=;
 b=q3pSBvo2urS/6ek6eLlHQgb1FNcB249grgCKWmHG0ZFezQCQv2sWSHJsD7WOTc6VUT
 lerqkOy0axf/B4MF1KiLaKd4nOeZ/4bxz2Y3jq6Ck5NA04rPHRl+MiBDbkb3xx/UDJeU
 mgPWxqTr4v1qWGNfORwvUNIPYGE/nt8BZjhU9+PLACWud9wNUUIRQLixlsiAPMr5H+5n
 4CMaJxIKMuI2wvfY8k6SdhmVzsjFySvicUj+zaMrI6CZsBvj1/UpvZRttjW1EDspNjQe
 vv/FFG87mHYQBMHD9d5v9maPOU0HF81hFbr1N+MTBx+FHHMxAqA+btcE7lUTgOiRKn7K
 M9nw==
X-Gm-Message-State: AOAM532UyrTDCOCiABymrMpv5GKtCCdDhaYat/cpiRF8ZlI/P/ypSelz
 VUAbRiGtROUoyCO3CAT2xl4PywLXYXp4TJYkEnE=
X-Google-Smtp-Source: ABdhPJyN0L6Lg+tDrvxAD4o3/ArnPQHIneDzLuy5Y3L9y8VnRCiaTHn+7cc8WOa3IbxOlmbcK4A+SFhO5NQmPPcgJZQ=
X-Received: by 2002:a17:906:70d5:: with SMTP id
 g21mr19049076ejk.340.1593868840390; 
 Sat, 04 Jul 2020 06:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200704122809.73794-1-konradybcio@gmail.com>
 <20200704130922.GB21333@willie-the-truck>
In-Reply-To: <20200704130922.GB21333@willie-the-truck>
From: Konrad Dybcio <konradybcio@gmail.com>
Date: Sat, 4 Jul 2020 15:20:04 +0200
Message-ID: <CAMS8qEU7owyk0ELmfE7f6Q_C0RT0cy3N=WtP0DzEUhV6KPnDhQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] iommu/arm-smmu: Implement qcom,skip-init
To: Will Deacon <will@kernel.org>
X-Mailman-Approved-At: Mon, 06 Jul 2020 08:05:12 +0000
Cc: DTML <devicetree@vger.kernel.org>, skrzynka@konradybcio.pl,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 john.stultz@linaro.org, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
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

> It would probably be better to know _which_ context banks we shouldn't
> touch, no? Otherwise what happens to the others?

> Do we not need to worry about the SMRs as well?

This was mimicked from CAF (think [1]) and the SMMUs don't make the
hypervisor angry anymore, so I wouldn't be too picky on that if it works..


[1] https://github.com/sonyxperiadev/kernel/blob/aosp/LA.UM.7.1.r1/drivers/iommu/arm-smmu.c#L4104-L4109

Regards
Konrad
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
