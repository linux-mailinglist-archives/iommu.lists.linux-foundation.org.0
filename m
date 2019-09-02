Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2F3A5CE2
	for <lists.iommu@lfdr.de>; Mon,  2 Sep 2019 22:08:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B1F77CCC;
	Mon,  2 Sep 2019 20:08:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 75AA2AC8
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 20:07:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A62515D3
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 20:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bwO6paLntB9VHU+vDBa67wTZajbeuF1FpPf0mZJIk0w=;
	b=sCslFkJnLr/LX7OsPedVuZai8
	pHXK0ahc+g1X+5fJjkqzYcoaFslGFu7+1+LmmXaIDHDtRtf6Gj2Vt8KQ5v5k0XYm8cNHvz0dMfYnx
	2fMwBcJbPGqLK9komjJUR6BkzWbQaI99xRNswidL1EzoAJNF1Y9cnzdllKG7VFDeHxHKJoPZVsmKK
	nrAQeLriv7uMbQU/FV063KkuJpLwDsZU5JrELh/LqYcF7cZSrZcyTrzRQ8mtWoKM8R3h6sckxdjbT
	szlfuh30LVLphVEPuVFIuD8458lxY75PNFUOyemWFQ9ooL6jW5TOUybShhepI7ZXBCaLwJIkgu7Ne
	8qyzWR1ww==;
Received: from [2001:4bb8:18c:1755:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1i4scD-0007MG-4R; Mon, 02 Sep 2019 20:07:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org, Loic Pallardy <loic.pallardy@st.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: remove various dma_declare_coherent related exports
Date: Mon,  2 Sep 2019 22:07:42 +0200
Message-Id: <20190902200746.16185-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
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

this is a refresh of and older series that tries to ensure that
drivers don't use the dma_declare_coherent function, which is
intende for platform code.  Unfortunately we've actually grown
a user in remoteproc since then.  While the maintainers havee
promised to fix that up that hasn't happened so far, so for now
this disabled the modular build for remoteproc until that has been
solved.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
