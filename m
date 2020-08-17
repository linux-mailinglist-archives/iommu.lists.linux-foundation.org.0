Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 42654245F6A
	for <lists.iommu@lfdr.de>; Mon, 17 Aug 2020 10:21:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EC7ED87885;
	Mon, 17 Aug 2020 08:21:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q7vCvgC-IHTY; Mon, 17 Aug 2020 08:21:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6CEFB87E32;
	Mon, 17 Aug 2020 08:21:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52D70C0895;
	Mon, 17 Aug 2020 08:21:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3832EC0051
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 08:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DDF35204B2
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 08:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h4idoif74J00 for <iommu@lists.linux-foundation.org>;
 Mon, 17 Aug 2020 08:21:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id D61DB20410
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 08:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Te7ybJvVG4iKO2ohYmX5Pvjiv68xvlZXMI+4wj+EaTc=; b=FAo9+ki050pf10fKywl/9gNJTQ
 x3y7tfPplgYWFFVugPLMoL5EzDHxr4EIGIzwq0+sVb9xkIoFbW/Dy8i19EWmeSauFXVEqJZ0iig4X
 7j5bYgCeagxq+CZZXNne2N0BZ1rJvU13gLxL1QoQtSeh5E/Bi6LenRtmHeNLlaaM/FonoTQli8aAt
 A4AcTxuiJ9FF533W0MJS5nb/d8gaIUDbMkHvtr24MIgkR07xPqnjT4vDfjPs2Hcg5C/dtsSPOi8s0
 Pl35tiScHmFYsOi9YYzLz08XY9rW0gthZ0/uCbyUa9PWCsdkLsRbo29PpH3z5Jfl9cX9JBdLVxj1I
 6BkVrfeg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1k7aOB-0004Z2-0d; Mon, 17 Aug 2020 08:21:07 +0000
Date: Mon, 17 Aug 2020 09:21:06 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 00/16] IOMMU driver for Kirin 960/970
Message-ID: <20200817082106.GA16296@infradead.org>
References: <cover.1597650455.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1597650455.git.mchehab+huawei@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 Joerg Roedel <jroedel@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxarm@huawei.com,
 Wei Xu <xuwei5@hisilicon.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 John Stultz <john.stultz@linaro.org>, Chenfeng <puck.chen@hisilicon.com>,
 mauro.chehab@huawei.com, Suzhuangluan <suzhuangluan@hisilicon.com>,
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

On Mon, Aug 17, 2020 at 09:49:59AM +0200, Mauro Carvalho Chehab wrote:
> Add a driver for the Kirin 960/970 iommu.
> 
> As on the past series, this starts from the original 4.9 driver from
> the 96boards tree:
> 
> 	https://github.com/96boards-hikey/linux/tree/hikey970-v4.9
> 
> The remaining patches add SPDX headers and make it build and run with
> the upstream Kernel.

Please don't add iommu drivers to staging, and just work with the
maintainers to properly clean it up.

I also don't think adding a totally out of date not compiling version
is a good idea.  Please do a proper rollup, and if required (probably
not in this case), split it into useful chunks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
