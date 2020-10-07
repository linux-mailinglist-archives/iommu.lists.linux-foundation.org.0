Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A792D28589C
	for <lists.iommu@lfdr.de>; Wed,  7 Oct 2020 08:25:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DD13D22D33;
	Wed,  7 Oct 2020 06:25:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6z29ch-23ciR; Wed,  7 Oct 2020 06:25:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 982C822D0D;
	Wed,  7 Oct 2020 06:25:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E115C0051;
	Wed,  7 Oct 2020 06:25:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73ECBC0051
 for <iommu@lists.linux-foundation.org>; Wed,  7 Oct 2020 06:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 672A122D0D
 for <iommu@lists.linux-foundation.org>; Wed,  7 Oct 2020 06:25:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KsSzd08-zz-j for <iommu@lists.linux-foundation.org>;
 Wed,  7 Oct 2020 06:25:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 4590D22636
 for <iommu@lists.linux-foundation.org>; Wed,  7 Oct 2020 06:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=hGY4fKBH3lXrbLnK7loOw4AUvRukRocZITr25lF2ycI=; b=PNf5g8627c2NOMQqhvL0eUPUY9
 pG18AoTA0MELpyOL/b9ay/ykTBDatHDGS3jlfCwIic9g3kmcO8E6ny88Ao5zGscnjagnX/WHNFZM5
 eZ2NTCUXNprEyCfiCQ/EGzyj6MxRlkn48EyhjY9cX/mqtGmGzUcF/05YoWWqOT3az/7lCzZyLl22/
 JnPVX/l/zI1jAPk8897xZBq8Pfmxbi5IX6xg+uZiAsB6ckYTKIB56aoRVnPqszsGMjoVPJQUTNCy1
 9FlS3lHhBHqvrySZFyfKyRFMIWGkyvr72addRKiyZPfjxgqJLXANCq04HlVz81s002Ig6I9P5Ekbx
 glO7NLFQ==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kQ2t5-0006Rp-Uy; Wed, 07 Oct 2020 06:25:19 +0000
Date: Wed, 7 Oct 2020 07:25:19 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent
 cache maintenance
Message-ID: <20201007062519.GA23519@infradead.org>
References: <20201001002709.21361-1-jonathan@marek.ca>
 <20201001002709.21361-3-jonathan@marek.ca>
 <20201002075321.GA7547@infradead.org>
 <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
 <20201005082914.GA31702@infradead.org>
 <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
 <20201006072306.GA12834@infradead.org>
 <148a1660-f0fc-7163-2240-6b94725342b5@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <148a1660-f0fc-7163-2240-6b94725342b5@marek.ca>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Robin Murphy <robin.murphy@arm.com>
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

On Tue, Oct 06, 2020 at 09:19:32AM -0400, Jonathan Marek wrote:
> One example why drm/msm can't use DMA API is multiple page table support
> (that is landing in 5.10), which is something that definitely couldn't work
> with DMA API.
> 
> Another one is being able to choose the address for mappings, which AFAIK
> DMA API can't do (somewhat related to this: qcom hardware often has ranges
> of allowed addresses, which the dma_mask mechanism fails to represent, what
> I see is drivers using dma_mask as a "maximum address", and since addresses
> are allocated from the top it generally works)

That sounds like a good enough rason to use the IOMMU API.  I just
wanted to make sure this really makes sense.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
