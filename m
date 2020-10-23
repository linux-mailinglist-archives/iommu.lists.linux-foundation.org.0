Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D070F296D91
	for <lists.iommu@lfdr.de>; Fri, 23 Oct 2020 13:23:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7988986679;
	Fri, 23 Oct 2020 11:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yao5qNHys+DL; Fri, 23 Oct 2020 11:23:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 92765867FF;
	Fri, 23 Oct 2020 11:23:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70C94C0051;
	Fri, 23 Oct 2020 11:23:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8871C0051
 for <iommu@lists.linux-foundation.org>; Fri, 23 Oct 2020 11:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AEF3C838CD
 for <iommu@lists.linux-foundation.org>; Fri, 23 Oct 2020 11:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t7UVKSn9Ft0q for <iommu@lists.linux-foundation.org>;
 Fri, 23 Oct 2020 11:23:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DDF12867FF
 for <iommu@lists.linux-foundation.org>; Fri, 23 Oct 2020 11:23:36 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EAFE220874;
 Fri, 23 Oct 2020 11:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603452216;
 bh=4b1pTClvfqTD0zeJGuECoVeoiBf7aRxXRCG/K9wwXUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A+yKUEZmcyz4U+bMeBwhee3V2xz86xPRPiz+jmZ2hND2fiBzsbBIAbIqBlMvHKUgX
 uB6JZuY0Ou/Qro2AbS0kCSt/ewsVPNBlH+/dOSZAvqwNUdotIExhxqXljN1sm8S38d
 YsY3corj/FTnHIaukNU1dJxmwAILU/aORvQSWUYw=
Date: Fri, 23 Oct 2020 12:23:29 +0100
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v3 10/24] iommu/io-pgtable-arm-v7s: Add cfg as a param in
 some macros
Message-ID: <20201023112329.GD20933@willie-the-truck>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-11-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930070647.10188-11-yong.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
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

On Wed, Sep 30, 2020 at 03:06:33PM +0800, Yong Wu wrote:
> Add "cfg" as a parameter for some macros. This is a preparing patch for
> mediatek extend the lvl1 pgtable. No functional change.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/io-pgtable-arm-v7s.c | 34 +++++++++++++++---------------
>  1 file changed, 17 insertions(+), 17 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

(but see my later comments above doing this for some of the 'constants' too)

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
