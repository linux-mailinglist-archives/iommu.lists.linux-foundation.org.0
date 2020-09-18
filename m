Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3601326F82D
	for <lists.iommu@lfdr.de>; Fri, 18 Sep 2020 10:29:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DABCE877CC;
	Fri, 18 Sep 2020 08:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1aAn44ZYR2PI; Fri, 18 Sep 2020 08:29:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2AA68877CD;
	Fri, 18 Sep 2020 08:29:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B09AC0888;
	Fri, 18 Sep 2020 08:29:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE054C0051
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 08:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D610E8724A
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 08:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ar1rXyzAPv_w for <iommu@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 08:29:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 529D686FC3
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 08:29:46 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 068E5396; Fri, 18 Sep 2020 10:29:42 +0200 (CEST)
Date: Fri, 18 Sep 2020 10:29:41 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: iommu: Add binding for MediaTek
 MT8167 IOMMU
Message-ID: <20200918082941.GE31590@8bytes.org>
References: <20200907101649.1573134-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907101649.1573134-1-fparent@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 miles.chen@mediatek.com, matthias.bgg@gmail.com,
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

On Mon, Sep 07, 2020 at 12:16:47PM +0200, Fabien Parent wrote:
> This commit adds IOMMU binding documentation and larb port definitions
> for the MT8167 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> 
> V4:
> 	* Added path to mt8167 larb header file
> 	* Added Honghui Zhang in copyright header
> V3: Added mt8167-larb-port.h file for iommu port definitions
> V2: no change

Applied all, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
