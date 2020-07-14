Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3D921EB45
	for <lists.iommu@lfdr.de>; Tue, 14 Jul 2020 10:27:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7267B884E4;
	Tue, 14 Jul 2020 08:27:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aZZyNkPRWBzT; Tue, 14 Jul 2020 08:27:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D2B0B884DF;
	Tue, 14 Jul 2020 08:27:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6756C08A9;
	Tue, 14 Jul 2020 08:27:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7523BC0733
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 08:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 43CA18A323
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 08:26:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-F0BsckZg98 for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 08:26:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DDAB3889D0
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 08:26:58 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C99E21835;
 Tue, 14 Jul 2020 08:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594715218;
 bh=rkHskXC0fiwa6QUMtcIea2p7i/6OpQKyeZInBl3W1JQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lcclkXtI6xPp5/1tsah+tsY4T4lVY3Dinfx5gzN3lmgiev/hCZ9q8C3ykXyXyNw+D
 rZKK1DCidNuCplg0/JzhvaiYgJidPKjCuFRlTALJMHMrGfZ20EivrOEkbCKuv3CieV
 SLO6dVBOWw7JYumLD1zzF9sVCOTiq10Z7ma3wZ9g=
Date: Tue, 14 Jul 2020 09:26:52 +0100
From: Will Deacon <will@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 1/2] iommu: Mark __iommu_map/__iommu_map_sg as static
Message-ID: <20200714082652.GB4516@willie-the-truck>
References: <cover.1591930156.git.baolin.wang@linux.alibaba.com>
 <ab722e9970739929738066777b8ee7930e32abd5.1591930156.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab722e9970739929738066777b8ee7930e32abd5.1591930156.git.baolin.wang@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, linux-kernel@vger.kernel.org, tomeu.vizoso@collabora.com,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 baolin.wang7@gmail.com, agross@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, daniel@ffwll.ch, matthias.bgg@gmail.com,
 steven.price@arm.com, robin.murphy@arm.com,
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

On Fri, Jun 12, 2020 at 11:39:54AM +0800, Baolin Wang wrote:
> Now the __iommu_map() and __iommu_map_sg() are used only in iommu.c
> file, so mark them as static.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  drivers/iommu/iommu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

(I'm assuming Joerg will pick this up for 5.9)

Thanks,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
