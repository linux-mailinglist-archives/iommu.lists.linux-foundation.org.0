Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5B334E745
	for <lists.iommu@lfdr.de>; Tue, 30 Mar 2021 14:16:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A506C607EA;
	Tue, 30 Mar 2021 12:16:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fplukCfCs_Y6; Tue, 30 Mar 2021 12:16:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBE4B606D9;
	Tue, 30 Mar 2021 12:16:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FB55C0011;
	Tue, 30 Mar 2021 12:16:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EBD45C000A;
 Tue, 30 Mar 2021 12:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBE5140146;
 Tue, 30 Mar 2021 12:16:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ApW3rQOCQuKM; Tue, 30 Mar 2021 12:16:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56DB1400B8;
 Tue, 30 Mar 2021 12:16:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EF476023F;
 Tue, 30 Mar 2021 12:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617106561;
 bh=bw8KBo/NNqB097evsMkXsyFAnnqW6iPTNtBok4bird8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QQpwu09zdg1APUNJpuxQhrkAfEgb8Xx8xBXTFO5/bqrnCy7nUn9ZszN5WLb+sq6vo
 5UJCLWYDMVJjHKt1uBKBD6MMh1tpUC2/ZJUxkV8BiHWJrvRd361XyyytEj+6Li42BI
 tfxcD7Rdfa0dzL9ZkwRo0SzzQKJrMa88AgwyNDnuPLKRwADNMLnkiOXhBm9+lE1tBR
 rdun4d9sUp5EgfOD94h55VT+FoWTTMYz/Myrov9kU9g5f+P8nfcOj+TX3m+W0J04yq
 y4bdrKMyq4yHZ4rqf7cqV7h7YmIgfRkPLJ7ViI7cikjVljJ7l7h/CdSxY5MyPkvqqz
 V8lAE4+4RFo3g==
Date: Tue, 30 Mar 2021 13:15:56 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/18] iommu/fsl_pamu: remove support for setting
 DOMAIN_ATTR_GEOMETRY
Message-ID: <20210330121555.GC5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-4-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Li Yang <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
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

On Tue, Mar 16, 2021 at 04:38:09PM +0100, Christoph Hellwig wrote:
> The default geometry is the same as the one set by qman_port given
> that FSL_PAMU depends on having 64-bit physical and thus DMA addresses.
> 
> Remove the support to update the geometry and remove the now pointless
> geom_size field.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c     | 55 +++--------------------------
>  drivers/iommu/fsl_pamu_domain.h     |  6 ----
>  drivers/soc/fsl/qbman/qman_portal.c | 12 -------
>  3 files changed, 5 insertions(+), 68 deletions(-)

Took me a minute to track down the other magic '36' which ends up in
aperture_end, but I found it eventually so:

Acked-by: Will Deacon <will@kernel.org>

(It does make me wonder what all this glue was intended to be used for)

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
