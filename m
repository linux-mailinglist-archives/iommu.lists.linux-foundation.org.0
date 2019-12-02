Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4349D10ED9C
	for <lists.iommu@lfdr.de>; Mon,  2 Dec 2019 17:59:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F222121543;
	Mon,  2 Dec 2019 16:59:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B3Wpf+ULunpP; Mon,  2 Dec 2019 16:59:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 739222152A;
	Mon,  2 Dec 2019 16:59:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6175DC1DD9;
	Mon,  2 Dec 2019 16:59:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88D91C087F
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 16:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 780AF86786
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 16:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id euDLSlZ0By8r for <iommu@lists.linux-foundation.org>;
 Mon,  2 Dec 2019 16:59:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1A6E1864F4
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 16:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3ykgoWuVkN+wjrzc/eQPiBn6mq0Gz+cdTGiRXv4caZY=; b=NrY935yLJ8NkW4ZaE2IcJgBmo
 6SR7tdZjZW4MHIKcNieD/doI4l7MARJLsJ+NuwPjj+RHUqRfDU8sH2e5nb19EG9mkmbmFgJrYEsCU
 MDFmhVAfj2ydBPVqNlADouYO2CUlBi4SyLOsShB0VRLwcX2iGQVSWdZhdVAC+LsHMysOsOpKCtaWU
 OV7pX/DMEST1e2cxzlb9Scjb4eXiG/FsU/IAl+dkuhW7Wee+/C0PmOv9aYE6Bo39VkhsaTV5JX87X
 0WPeYCTBdyxgvd+PtEC2QQlfMNYO32QyPen4M2svV1gsrLpBPNsYrq4Kute69OejDiFP7evDuX4F/
 H2PheOe+A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ibp2f-0007u9-Lh; Mon, 02 Dec 2019 16:59:21 +0000
Date: Mon, 2 Dec 2019 08:59:21 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Cong Wang <xiyou.wangcong@gmail.com>
Subject: Re: [Patch v2 2/3] iommu: optimize iova_magazine_free_pfns()
Message-ID: <20191202165921.GB30032@infradead.org>
References: <20191129004855.18506-1-xiyou.wangcong@gmail.com>
 <20191129004855.18506-3-xiyou.wangcong@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129004855.18506-3-xiyou.wangcong@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

> +	return (mag && mag->size == IOVA_MAG_SIZE);

> +	return (!mag || mag->size == 0);

No need for the braces in both cases.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
