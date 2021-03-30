Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B786F34E703
	for <lists.iommu@lfdr.de>; Tue, 30 Mar 2021 14:04:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B73C40460;
	Tue, 30 Mar 2021 12:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BQK_vikvkVFY; Tue, 30 Mar 2021 12:04:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45CC940244;
	Tue, 30 Mar 2021 12:04:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1053FC000A;
	Tue, 30 Mar 2021 12:04:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AA25C000A;
 Tue, 30 Mar 2021 12:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8867F60799;
 Tue, 30 Mar 2021 12:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nN9RefOCNI0f; Tue, 30 Mar 2021 12:04:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA82D60790;
 Tue, 30 Mar 2021 12:04:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0CD06195B;
 Tue, 30 Mar 2021 12:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617105871;
 bh=6lm/PXN71Uir/6tazMMJc+s4JuYrI2y+JzG4+8YAJhw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=toQXrnSU6/gZu+6PPauuicGLb94pd7n0XyLk8JnR+r5R5rWdj54O3RYy7OJvZL4ZY
 bPxVP2yvzMMPMyUjXZxD4XCBRh7f29x45knN6+nXtorlREyk/7vAgv9iUqmSh4TlS2
 vdsfHS+S/57xjYj2m3B+qviRK8SdN+qUPgYXpwI3f0mcadVAhUxMOsadYcv4eDmtcJ
 5UciMBlATzimYaHgy85EsBEoLrkxghxZx+4SPSMGbCcNHmMR9YmbXG57ovKw1sbrWR
 YSQbAWHgq61gFUNkL+lrjGPFPns4GrbiDAIse2dIZrcaJq2SMG6xACemPJOmutKdyt
 m+UBVbGX7BjqQ==
Date: Tue, 30 Mar 2021 13:04:25 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/18] iommu: remove the unused domain_window_disable
 method
Message-ID: <20210330120418.GA5864@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-2-hch@lst.de>
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

On Tue, Mar 16, 2021 at 04:38:07PM +0100, Christoph Hellwig wrote:
> domain_window_disable is wired up by fsl_pamu, but never actually called.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c | 48 ---------------------------------
>  include/linux/iommu.h           |  2 --
>  2 files changed, 50 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
