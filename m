Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2174419FFAE
	for <lists.iommu@lfdr.de>; Mon,  6 Apr 2020 23:00:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D6B218639F;
	Mon,  6 Apr 2020 21:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xjZgyR5sLeaV; Mon,  6 Apr 2020 21:00:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 74FB4863AC;
	Mon,  6 Apr 2020 21:00:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B9F6C0177;
	Mon,  6 Apr 2020 21:00:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACB2FC0177
 for <iommu@lists.linux-foundation.org>; Mon,  6 Apr 2020 21:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A01F620015
 for <iommu@lists.linux-foundation.org>; Mon,  6 Apr 2020 21:00:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lYqdpKAKYhgZ for <iommu@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:00:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id D33D32000F
 for <iommu@lists.linux-foundation.org>; Mon,  6 Apr 2020 21:00:49 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id b72so8184906pfb.11
 for <iommu@lists.linux-foundation.org>; Mon, 06 Apr 2020 14:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kN7EdV3TB2LLwhC8lF0q0y2wPgwg6vmGC+AEPO56+lI=;
 b=Y5OI7GP+UE/pkAz0PiB49QC8C9Lg9D7fVn9yeeNUyNHKhQQ/9WYAXMY6P8Uu2JME+7
 4Z2CYR1UJoEeDZbbPOQSn6H5ivkq2JXiU2G3WZBfz62usKvfhqYp0Jnxot1rDlRVsWS+
 YW9kneDpHtG5gmywhyAShXe/1B/TWpN+YGr5z9t6JD/n9hHHVWFeruzOsfhXHEq3B0RU
 aQl8F2wD9lDpWBVC1bbUUhDBhNnEI4k1u0ngX3J0cswd0Po++83Y1l/GslOJCjgVGgtL
 YnFQxQsjtoxF6qKvDuRrpmG2tijTCz6dAQdzudtocrFO46noFpS8SxBJ6ixq1Q9glGGk
 xpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kN7EdV3TB2LLwhC8lF0q0y2wPgwg6vmGC+AEPO56+lI=;
 b=irgbw1Dnrk4zStBrC9vUceU2pt7qfUS29ZnOZExjwIb4vsWzsK1bQw+zUnQZjwxuVu
 XOv46FqnqhCsDqcxAru62dz53GXBTPEZNeP48A5V06ZBO35rghZoKLJ95b34Uzx6AljZ
 BUhXMfV4vtuwfLiHndc26/Pj14gdozzdPZp0/0G8Es2pcH2iBj/oHt8ELN9P+u8Hfwlx
 wZy4Ph0O44v7Pcua8uxUKeqC1sxoO77nfng4dX3uzytsn+Nah49fA6mgFZ2BCQMTmQq7
 z6PmmGbBycggMwh9FxrMzoBsTyCOYwtJvsE77OD0NhBrVbMlWagyBXDKLMdM769KqiOy
 pHuA==
X-Gm-Message-State: AGi0PuZYGQSYBifMEagd77hGo8FNe+EY/niEKV+PDk5+sW2HvvS6MS6k
 gVuICiY1+twPpY7NlBgS4lk=
X-Google-Smtp-Source: APiQypIltXLyrYZ7Y0t4XNDZFTS4Xd3NXqK9KUWvQSVVWrmDozS8CK0rmTYZ8Thgsxsqf1eR+tKF4Q==
X-Received: by 2002:a63:78e:: with SMTP id 136mr929138pgh.181.1586206849172;
 Mon, 06 Apr 2020 14:00:49 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id q6sm447085pja.34.2020.04.06.14.00.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Apr 2020 14:00:48 -0700 (PDT)
Date: Mon, 6 Apr 2020 14:00:51 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [RFC/RFT][PATCH] dma-mapping: set default segment_boundary_mask
 to ULONG_MAX
Message-ID: <20200406210050.GA20495@Asurada-Nvidia.nvidia.com>
References: <20200405005157.1318-1-nicoleotsuka@gmail.com>
 <c984d2ea-6036-a8ae-97df-b5178a2a9ab9@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c984d2ea-6036-a8ae-97df-b5178a2a9ab9@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, hch@lst.de
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

On Mon, Apr 06, 2020 at 02:48:13PM +0100, Robin Murphy wrote:
> On 2020-04-05 1:51 am, Nicolin Chen wrote:
> > The default segment_boundary_mask was set to DMA_BIT_MAKS(32)
> > a decade ago by referencing SCSI/block subsystem, as a 32-bit
> > mask was good enough for most of the devices.
> > 
> > Now more and more drivers set dma_masks above DMA_BIT_MAKS(32)
> > while only a handful of them call dma_set_seg_boundary(). This
> > means that most drivers have a 4GB segmention boundary because
> > DMA API returns a 32-bit default value, though they might not
> > really have such a limit.
> > 
> > The default segment_boundary_mask should mean "no limit" since
> > the device doesn't explicitly set the mask. But a 32-bit mask
> > certainly limits those devices capable of 32+ bits addressing.
> > 
> > And this 32-bit boundary mask might result in a situation that
> > when dma-iommu maps a DMA buffer (size > 4GB), iommu_map_sg()
> > cuts the IOVA region into discontiguous pieces, and creates a
> > faulty IOVA mapping that overlaps some physical memory outside
> > the scatter list, which might lead to some random kernel panic
> > after DMA overwrites that faulty IOVA space.
> 
> Once again, get rid of this paragraph - it doesn't have much to do with the
> *default* value since it describes a behaviour general to any boundary mask.
> Plus it effectively says "if a driver uses a DMA-mapped scatterlist
> incorrectly, this change can help paper over the bug", which is rather the
> opposite of a good justification.

Np. Will drop it and resend.

> (for example most SATA devices end up with a 64KB boundary mask, such that
> padding the IOVAs to provide the appropriate alignment happens very
> frequently, and they've been working just fine for years now)

Okay.

Thanks!
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
