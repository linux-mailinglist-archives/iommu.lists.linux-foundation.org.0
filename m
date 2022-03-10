Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1824D4149
	for <lists.iommu@lfdr.de>; Thu, 10 Mar 2022 07:41:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E043A842C0;
	Thu, 10 Mar 2022 06:41:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ZmFeMXW2B5E; Thu, 10 Mar 2022 06:41:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 073B0842BE;
	Thu, 10 Mar 2022 06:41:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA003C0073;
	Thu, 10 Mar 2022 06:41:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCC87C000B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Mar 2022 06:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2E0840545
 for <iommu@lists.linux-foundation.org>; Thu, 10 Mar 2022 06:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jobPv4hlCYJW for <iommu@lists.linux-foundation.org>;
 Thu, 10 Mar 2022 06:41:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7EB2740260
 for <iommu@lists.linux-foundation.org>; Thu, 10 Mar 2022 06:41:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6452B68AFE; Thu, 10 Mar 2022 07:41:43 +0100 (CET)
Date: Thu, 10 Mar 2022 07:41:43 +0100
From: Christoph Hellwig <hch@lst.de>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH v2] dma-mapping: benchmark: Extract a common header
 file for map_benchmark definition
Message-ID: <20220310064143.GB24359@lst.de>
References: <20220308085910.37358-1-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220308085910.37358-1-tiantao6@hisilicon.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linuxarm@openeuler.org, iommu@lists.linux-foundation.org,
 linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org, shuah@kernel.org,
 hch@lst.de
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

Thanks,

applied to the dma-mapping tree for Linux 5.18.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
