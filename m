Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F9B39A0CA
	for <lists.iommu@lfdr.de>; Thu,  3 Jun 2021 14:27:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 195BD607F3;
	Thu,  3 Jun 2021 12:27:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NZm2MVM4LDhT; Thu,  3 Jun 2021 12:27:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id C212E608B4;
	Thu,  3 Jun 2021 12:27:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BDD1C0024;
	Thu,  3 Jun 2021 12:27:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BEDF9C0001
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 12:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A087E60630
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 12:24:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JZGltzvrfPCH for <iommu@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 12:24:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E80A607F3
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 12:24:21 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id b9so8499434ybg.10
 for <iommu@lists.linux-foundation.org>; Thu, 03 Jun 2021 05:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nQTNZDhOre7iCF0Cz3dK7kuboW0bx4oq6Dq0Z2ourcg=;
 b=GkrM5vRwIir6c6geza3ObTHY5OfQQKqpPG5ez/l7ZUEwPXAHuanRyWk78a2vkv3es9
 f4mwxfB0vAt8RzZ/+gvYLDpcy352RKk8lGIkKoGyz1vRSdfiOm3kYjWVSKgUpg8GepKT
 8Y0Dq+qe1zG+nYSK0goKh1BlracUtmJEZCmmQTTUc7pLrh2D568rjIuKtNSJJXv9BosN
 tubCOfuflwLOlR8uiXCpOEYORpUuHT6KLZzUzZL9cil1Sko42G/zpBddWq3ZtY/Xbtfm
 tI61aFuMhZ4SfWh9vMoEnT9OQqyp6H1+UxS6i/7amUyUjmEZiVgPOfbw3FprikMXl4oO
 84WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nQTNZDhOre7iCF0Cz3dK7kuboW0bx4oq6Dq0Z2ourcg=;
 b=tipvk4/GvEwI+qJ31AtiPoKQzEvQXEBFEbMN+7rxa8L6r/6mzI1W5npJuaoJp80znS
 KTj3GH8vs06oW9xPJpbxMGWXziAqEg5Bz1SK6HlhS0Wyi+5Q9xqowdvJK5fNJ+XD1cKU
 gAiNg8c/CQRGKUmf8miQYHdbeQyfb/P9E8Kb5rZxIZJgrw0zOF9rXBCCNlqGOQ86dnWP
 GgisLhRDqn0Jyf4Fx8fRIJY3RZLYal9hdrwK1gD1j58l1HIKU8gYNxpOK0BayVPaRWqc
 foVLVqzblr9mLgPDXBg8Ws5qsFvjX184JqzHIt3G2e6W+dNuOoxbhiHTYkNcNNKUZP6p
 i1hg==
X-Gm-Message-State: AOAM531BhRCLND9OydWWGTH8kDOxdUWs+OMCtAAPo728QNI6E8B7yu76
 9JwjAJy3BEAZsXAT4wmVn3Ix3d2v1GSx1adf89E=
X-Google-Smtp-Source: ABdhPJzUnO+t1xkDb7EFXdjCxXK2AyV5EDQsYEgtIvD3rhr2W5k+IH2ADj9nvL+xwcO6eBS0XyDDNeLsWT1MnIhI15s=
X-Received: by 2002:a25:3c87:: with SMTP id
 j129mr53775021yba.141.1622723060265; 
 Thu, 03 Jun 2021 05:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <2021052710373173260118@rock-chips.com>
 <5d7127d5-b73c-2002-1734-98aab2295c8e@arm.com>
In-Reply-To: <5d7127d5-b73c-2002-1734-98aab2295c8e@arm.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Thu, 3 Jun 2021 08:24:09 -0400
Message-ID: <CAMdYzYpiykTtK3CtAN9F4g+f6JasTSsUh54wvAZ_st3C=_LygQ@mail.gmail.com>
Subject: Re: Different type iommus integrated in a SoC
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Approved-At: Thu, 03 Jun 2021 12:27:49 +0000
Cc: linux-rockchip <linux-rockchip@lists.infradead.org>,
 iommu <iommu@lists.linux-foundation.org>, will <will@kernel.org>,
 hch <hch@lst.de>
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

On Thu, Jun 3, 2021 at 8:07 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2021-05-27 03:37, xxm@rock-chips.com wrote:
> > Hi all,
> >
> > I have a SoC integrate with two different types of iommus, one is ARM SMMU, serves the PCIe/SATA/USB,
> > the others are vendor specific iommus, serves display device and multimedia device.
> >
> > In the current linux kernel, the iommu framework seems only support one type iommu at runtime, if enable both types iommu, only one type can work.
> > Is there any way to support this kind of SoC?
>
> Hooray! I've been forecasting this for years, but the cases we regularly
> hit with internal FPGA prototyping (nor the secret unused MMU-400 I
> found on RK3288) have never really been a strong enough argument to
> stand behind.
>
> Based on what I remember from looking into this a few years ago,
> converting *most* of the API to per-device ops (now via dev->iommu) is
> trivial; the main challenge will be getting the per-device data
> bootstrapped in iommu_probe_device(), which would probably need to rely
> on the fwspec and/or list of registered IOMMU instances.
>
> The other notable thing which will need to change is the domain
> allocation interface, but in practice I think everyone who calls
> iommu_domain_alloc() today is in fact doing so for a specific device, so
> I don't think it's as big a problem as it might first appear.
>
> Robin.
>

Good Morning Robin,

I think the Tegra group would also be interested in this work.
AFAIK they have the smmu and the tegra gart and have been trying to
figure out the runtime handover from the bootloader to the kernel
without smashing everything and starting over.

Thanks,
Peter Geis
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
