Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A876339BB4B
	for <lists.iommu@lfdr.de>; Fri,  4 Jun 2021 16:57:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 164D4400C6;
	Fri,  4 Jun 2021 14:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uu1KNP5Uq5dA; Fri,  4 Jun 2021 14:57:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id A54BD4061A;
	Fri,  4 Jun 2021 14:57:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A1BAC0001;
	Fri,  4 Jun 2021 14:57:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61CCBC0001
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 14:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43FD0839A4
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 14:56:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nv7g1gqh8WkS for <iommu@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 14:56:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79F36841F0
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 14:56:56 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B3ED73A9; Fri,  4 Jun 2021 16:56:54 +0200 (CEST)
Date: Fri, 4 Jun 2021 16:56:53 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v7 0/4] Add IOMMU driver for rk356x
Message-ID: <YLo/NZaPZ6snoG2X@8bytes.org>
References: <20210525121551.606240-1-benjamin.gaignard@collabora.com>
 <YLo+wa5Z3KILTgrR@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLo+wa5Z3KILTgrR@8bytes.org>
Cc: devicetree@vger.kernel.org, heiko@sntech.de, will@kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org, kernel@collabora.com,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
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

On Fri, Jun 04, 2021 at 04:54:58PM +0200, Joerg Roedel wrote:
> On Tue, May 25, 2021 at 02:15:47PM +0200, Benjamin Gaignard wrote:
> > Benjamin Gaignard (4):
> >   dt-bindings: iommu: rockchip: Convert IOMMU to DT schema
> >   dt-bindings: iommu: rockchip: Add compatible for v2
> >   iommu: rockchip: Add internal ops to handle variants
> 
> Applied patches 1-3, thanks.

Hmm, no, unapplied. Your separate patch 4 came before the kbuild-bot
reports. Can you fix those please and submit a v8?

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
