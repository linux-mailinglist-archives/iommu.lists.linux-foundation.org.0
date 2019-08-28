Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5E7A0478
	for <lists.iommu@lfdr.de>; Wed, 28 Aug 2019 16:15:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B17B030C6;
	Wed, 28 Aug 2019 14:15:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B921C30B2
	for <iommu@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 14:15:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 855F913A
	for <iommu@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 14:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6rDsAjXtgHuoENe2BDRKRs4vEoPiD7Zi5fpWyf81iqE=;
	b=suUi86WsP4Cg2rN2Vo+u+2OHE
	J8vy9p1eaA1Oew6VTAjT8CCrTFxU5g8fq37tY9DskhJKF/nlZA3q9vxu87LaV3kVlbCk9HRD6Ti+q
	0QdJbvBwNZ8sV59cGXt4XML08AHjMkuBuC3xO7IUE33Qppl1w9qLFRy0iveSAHvqL2ccwi04MqU/W
	S4q4Hud6bgCQmn4yYEhI+gSisfnAUsgS4ruvRMgX3/7nq78ZT0dR6oTXwHWNiRbFBkSlhDeCgZMv4
	lztj5I3kT2eWZ2D0ULjCPCnH5KJw4B6XkWB6LWScmQ2GhdT8E69jn4v8Hp2b1Q+EoO/SkTZU5+stE
	BollTDDAA==;
Received: from [2001:4bb8:180:3f4c:863:2ead:e9d4:da9f] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1i2yij-0000T4-P7; Wed, 28 Aug 2019 14:14:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>,
	"Derrick, Jonathan" <jonathan.derrick@intel.com>
Subject: stop overriding dma_ops in vmd v2
Date: Wed, 28 Aug 2019 16:14:38 +0200
Message-Id: <20190828141443.5253-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-pci@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, bhelgaas@google.com, dwmw2@infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi all,

this is a new version of the vmd dma_map_ops removal, which does not
require vmd to be built in.  Instead we slightly expand the vmd-specific
field in the x86 pci_sysdata to cover that information.

Note that I do not have a vmd-enable system, so some testing by the
maintainers would be welcome.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
