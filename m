Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B93B5026D7
	for <lists.iommu@lfdr.de>; Fri, 15 Apr 2022 10:40:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DADAD40448;
	Fri, 15 Apr 2022 08:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X3ruqmH06gXi; Fri, 15 Apr 2022 08:40:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B3301400FA;
	Fri, 15 Apr 2022 08:40:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75238C0088;
	Fri, 15 Apr 2022 08:40:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2F84C002C
 for <iommu@lists.linux-foundation.org>; Fri, 15 Apr 2022 08:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A8B340A83
 for <iommu@lists.linux-foundation.org>; Fri, 15 Apr 2022 08:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 57LxQVwKMlDo for <iommu@lists.linux-foundation.org>;
 Fri, 15 Apr 2022 08:40:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57AA9400DB
 for <iommu@lists.linux-foundation.org>; Fri, 15 Apr 2022 08:40:02 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1nfHUc-003EXs-Lt; Fri, 15 Apr 2022 18:39:52 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 15 Apr 2022 16:39:50 +0800
Date: Fri, 15 Apr 2022 16:39:50 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] crypto: qat - stop using iommu_present()
Message-ID: <YlkvVssU6P7vrHUU@gondor.apana.org.au>
References: <ef01fbd7d2c60d56a0b8e8847a08ccb3ee5132af.1649161511.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef01fbd7d2c60d56a0b8e8847a08ccb3ee5132af.1649161511.git.robin.murphy@arm.com>
Cc: linux-kernel@vger.kernel.org, qat-linux@intel.com,
 iommu@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
 davem@davemloft.net
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

On Tue, Apr 05, 2022 at 01:25:11PM +0100, Robin Murphy wrote:
> Even if an IOMMU might be present for some PCI segment in the system,
> that doesn't necessarily mean it provides translation for the device
> we care about. Replace iommu_present() with a more appropriate check.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/crypto/qat/qat_common/adf_sriov.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
