Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4C320CE9D
	for <lists.iommu@lfdr.de>; Mon, 29 Jun 2020 15:04:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C33FA89396;
	Mon, 29 Jun 2020 13:04:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sp-orRNNdEPo; Mon, 29 Jun 2020 13:04:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 53FE289398;
	Mon, 29 Jun 2020 13:04:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37F88C016E;
	Mon, 29 Jun 2020 13:04:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B1EFC016E
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 13:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3D0058883F
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 13:04:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s+c8ho4ifsJ9 for <iommu@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 13:04:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F283A89396
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 13:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=hCeEFPJauELL9pZELwR8NI9hO7+eRck24vlEYcHykOI=; b=jWJmLvGHLCXZqD+9nHGBpk8RJJ
 tZEw3mH374vZSArhHhnpGf3fzMx6xn+4T+ORiEdT5+4lPhWyDdnz3JjTZh9/3Wtck2vqFScH/9G/J
 u4LVSP/cj9xTJk4Ckay1YCcJrlSpYpCPwix/DUpDcxoNbuscvo6HKYUYw09OpXMQGOUG1UPKk5h1R
 I3eShOTEfFGU9Ja0KzA7j41GBHdpp5HO/DOzw6cKjpixzfNV8H9j71Gb6OnIfIM/OBDTmJC5gUL61
 YFnCpxS9+nbGCj3YwQd7bAh3L87CfMsmO+LuaXEzqneInL6n6Nzaas0SsF/W9iCpEmQP30CE7l3I7
 yMgYzDrw==;
Received: from [2001:4bb8:184:76e3:c71:f334:376b:cf5f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jptS5-0004Wr-LR; Mon, 29 Jun 2020 13:04:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>
Subject: add an API to check if a streamming mapping needs sync calls
Date: Mon, 29 Jun 2020 15:03:55 +0200
Message-Id: <20200629130359.2690853-1-hch@lst.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Jonathan Lemon <jonathan.lemon@gmail.com>,
 bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>
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

this series lifts the somewhat hacky checks in the XSK code if a DMA
streaming mapping needs dma_sync_single_for_{device,cpu} calls to the
DMA API.


Diffstat:
 Documentation/core-api/dma-api.rst |    8 +++++
 include/linux/dma-direct.h         |    1 
 include/linux/dma-mapping.h        |    5 +++
 include/net/xsk_buff_pool.h        |    6 ++--
 kernel/dma/direct.c                |    6 ++++
 kernel/dma/mapping.c               |   10 ++++++
 net/xdp/xsk_buff_pool.c            |   54 ++-----------------------------------
 7 files changed, 37 insertions(+), 53 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
