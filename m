Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 93888529DDF
	for <lists.iommu@lfdr.de>; Tue, 17 May 2022 11:22:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A1AD81A27;
	Tue, 17 May 2022 09:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rCcl682AAsCD; Tue, 17 May 2022 09:22:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5071881A5C;
	Tue, 17 May 2022 09:22:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10911C0081;
	Tue, 17 May 2022 09:22:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93898C002D
 for <iommu@lists.linux-foundation.org>; Tue, 17 May 2022 09:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73B43400FD
 for <iommu@lists.linux-foundation.org>; Tue, 17 May 2022 09:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fjqNvJW-B0fl for <iommu@lists.linux-foundation.org>;
 Tue, 17 May 2022 09:22:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8A3F400B8
 for <iommu@lists.linux-foundation.org>; Tue, 17 May 2022 09:22:27 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 74B9E67373; Tue, 17 May 2022 11:22:21 +0200 (CEST)
Date: Tue, 17 May 2022 11:22:21 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [PATCH] swiotlb: Max mapping size takes min align mask into
 account
Message-ID: <20220517092221.GA22179@lst.de>
References: <20220510142109.777738-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220510142109.777738-1-ltykernel@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: parri.andrea@gmail.com, michael.h.kelley@microsoft.com, wei.liu@kernel.org,
 sthemmin@microsoft.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 konrad.wilk@oracle.com, haiyangz@microsoft.com, decui@microsoft.com,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, hch@infradead.org,
 iommu@lists.linux-foundation.org, hch@lst.de, thomas.lendacky@amd.com,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, vkuznets@redhat.com, kys@microsoft.com,
 robin.murphy@arm.com, jejb@linux.ibm.com
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

applied to the dma-mapping for-next tree.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
