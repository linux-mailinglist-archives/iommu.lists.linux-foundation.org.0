Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9462810ED9B
	for <lists.iommu@lfdr.de>; Mon,  2 Dec 2019 17:58:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4ACCE86819;
	Mon,  2 Dec 2019 16:58:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hKroENzr3SZH; Mon,  2 Dec 2019 16:58:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3DCF286786;
	Mon,  2 Dec 2019 16:58:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26587C087F;
	Mon,  2 Dec 2019 16:58:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE21BC087F
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 16:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BCE59885DE
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 16:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rGxkRHWIovRg for <iommu@lists.linux-foundation.org>;
 Mon,  2 Dec 2019 16:58:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 51F1A88187
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 16:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kvx6skM6KVyZP6v62kIm1BhsFXAktdiWmhoWDqy+TEc=; b=ZqEi2ozaBFH7Wa44iB6r0PCBb
 Rs7SdB7N4Y0ct95W25LSYY89vpmWYvZi1BNw1dzj0ysG0iVnsGmVi/WJXcHSVSV1Q8+LC5TwwIKy6
 2aLZAY83lf55HTfR1UHHRNUPqc7TuWcboJmlFrlcO16k4mHPbALEp9RM8TpsRN3xMlPrWPl62pIqt
 Xgkn0nc70iRbSuvQ4PVIBgS2ZntcH4DDycZgo+7vxSnXT9rdcdihcFBxTElv6jJhYHTcVoG6ggQSy
 Pj5G2TV5B/ky+efAbARDW660Z105E3B/0HVyw4w168Xv34AQ096XHlbLhGemRPhofO83m73PhIAEF
 R/r2wuLEg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ibp27-0007sl-CK; Mon, 02 Dec 2019 16:58:47 +0000
Date: Mon, 2 Dec 2019 08:58:47 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Cong Wang <xiyou.wangcong@gmail.com>
Subject: Re: [Patch v2 1/3] iommu: match the original algorithm
Message-ID: <20191202165847.GA30032@infradead.org>
References: <20191129004855.18506-1-xiyou.wangcong@gmail.com>
 <20191129004855.18506-2-xiyou.wangcong@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129004855.18506-2-xiyou.wangcong@gmail.com>
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

I think a subject line better describes what you change, no that
it matches an original algorithm.  The fact that the fix matches
the original algorithm can go somewhere towards the commit log,
preferably with a reference to the actual paper.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
