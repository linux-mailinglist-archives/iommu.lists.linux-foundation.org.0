Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0001D39BB41
	for <lists.iommu@lfdr.de>; Fri,  4 Jun 2021 16:55:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F74B401F4;
	Fri,  4 Jun 2021 14:55:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sfQlnI7meq0Y; Fri,  4 Jun 2021 14:55:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47C9140150;
	Fri,  4 Jun 2021 14:55:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B1F6C001C;
	Fri,  4 Jun 2021 14:55:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 043AAC0001
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 14:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6A65415A5
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 14:55:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id omrrTkxbbjUz for <iommu@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 14:55:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 074A740630
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 14:55:02 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E92D83A9; Fri,  4 Jun 2021 16:54:58 +0200 (CEST)
Date: Fri, 4 Jun 2021 16:54:57 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v7 0/4] Add IOMMU driver for rk356x
Message-ID: <YLo+wa5Z3KILTgrR@8bytes.org>
References: <20210525121551.606240-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210525121551.606240-1-benjamin.gaignard@collabora.com>
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

On Tue, May 25, 2021 at 02:15:47PM +0200, Benjamin Gaignard wrote:
> Benjamin Gaignard (4):
>   dt-bindings: iommu: rockchip: Convert IOMMU to DT schema
>   dt-bindings: iommu: rockchip: Add compatible for v2
>   iommu: rockchip: Add internal ops to handle variants

Applied patches 1-3, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
