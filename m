Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DD647151602
	for <lists.iommu@lfdr.de>; Tue,  4 Feb 2020 07:32:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 883A184C1E;
	Tue,  4 Feb 2020 06:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0VSzQlYf2FmC; Tue,  4 Feb 2020 06:32:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 54BDE84BAF;
	Tue,  4 Feb 2020 06:32:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34E8EC0174;
	Tue,  4 Feb 2020 06:32:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53A08C0174
 for <iommu@lists.linux-foundation.org>; Tue,  4 Feb 2020 06:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 39EED203F1
 for <iommu@lists.linux-foundation.org>; Tue,  4 Feb 2020 06:32:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2g3pXFjKEpfo for <iommu@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 06:32:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id 33C562014A
 for <iommu@lists.linux-foundation.org>; Tue,  4 Feb 2020 06:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=1QxZjRqjnFjTb1sgbB1Wf34MvqsNRVQ5mMrKgwxIKOk=; b=tpzlqOwwPTA6HAldDsz5llSXDr
 mRaGNkFoeTvS5vXPKpY0XND5lRWQsE0JzKsluyNZwfavotkwNNhQy1hcJ0ZeZ17ln5k89EyxhhloA
 qfkLr/LnX1whiO8sYjFoDDHrLKKU0vpMylgSYDBgHKdvUYVLZX4lzo5hl9t6Wq8otkRFDJEf0teCs
 r/+0qF+GdpM9hvpPywkPuekpf9P8vh8ogO4nBCZg8s5XoIBAczfAFJbtfLjZCRlY+156M0ZNd5KTR
 fmWmdkqvKQHJSMS7dW5JHpIeWmRdUSqXqb7KpB6tqf2Vjs4kCQYMAr4uQrx20tIGkY0wlb1WLq6c2
 DKZLRzOA==;
Received: from [2001:4bb8:184:589f:5d35:7054:f1cc:c43d] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyrkl-00088Q-Bh; Tue, 04 Feb 2020 06:32:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: improve dma-direct / swiotlb error reporting
Date: Tue,  4 Feb 2020 07:32:03 +0100
Message-Id: <20200204063205.652456-1-hch@lst.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: iommu@lists.linux-foundation.org
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

Hi all,

this small series improves the message when the dma mask overflows,
and splits the warning for the genuine dma mask overflow from that
of a not addressable swiotlb buffer to help better diagnosing the
root cause.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
