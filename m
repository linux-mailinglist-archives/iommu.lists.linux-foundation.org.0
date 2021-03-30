Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABB834E82F
	for <lists.iommu@lfdr.de>; Tue, 30 Mar 2021 15:00:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5520683E26;
	Tue, 30 Mar 2021 13:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1owqPUikz3xO; Tue, 30 Mar 2021 13:00:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6813D83E7A;
	Tue, 30 Mar 2021 13:00:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A06F1C0017;
	Tue, 30 Mar 2021 13:00:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C2A9C000A;
 Tue, 30 Mar 2021 13:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1BAF60708;
 Tue, 30 Mar 2021 13:00:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c2ykLNjIJlHO; Tue, 30 Mar 2021 13:00:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5536960596;
 Tue, 30 Mar 2021 13:00:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6723461959;
 Tue, 30 Mar 2021 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617109224;
 bh=m3TvkxvqPC7Tpakpaq16UQpVjJGrx5gC57aV7gCm8GE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q+OSrGSvrWc7WYths8Js73WEMx795hdLZQgMXoL3dU2M1loRm7gpXJPstw5r96wE+
 MHERTkZdUmMqt0s1BPvMPCPEFoJZkJamnTKDq4K4rys4fqbm/nejUkGZhZ84T7bvZv
 Ler6sSRcp45AsVGHeW+zKyc/iZ0K+xWrwbiiAvOv9AdkdKTu7n28KdSWcWg3TCBiwH
 efhhakrMIGdlWHG5y8cLowYyjKPeJvPwVS1ZDVu/G3v2OfwKusR9D1kPYvmwIyRcwB
 RPVE1raY7AUORsYfBkgmuAg8ie5APSgAugC4iRu1nKmYUKDnrH6tc0xtIdlm9sb2o9
 UNwLXhfk0L68Q==
Date: Tue, 30 Mar 2021 14:00:19 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 13/18] iommu: remove DOMAIN_ATTR_GEOMETRY
Message-ID: <20210330130019.GM5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-14-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-14-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:19PM +0100, Christoph Hellwig wrote:
> The geometry information can be trivially queried from the iommu_domain
> struture.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/iommu.c           | 20 +++-----------------
>  drivers/vfio/vfio_iommu_type1.c | 26 ++++++++++++--------------
>  drivers/vhost/vdpa.c            | 10 +++-------
>  include/linux/iommu.h           |  1 -
>  4 files changed, 18 insertions(+), 39 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
