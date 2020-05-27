Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 445281E4291
	for <lists.iommu@lfdr.de>; Wed, 27 May 2020 14:42:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EBE9A87EDB;
	Wed, 27 May 2020 12:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5oXDSzDZd5Jw; Wed, 27 May 2020 12:42:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8BA1087ED9;
	Wed, 27 May 2020 12:42:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72DD1C0892;
	Wed, 27 May 2020 12:42:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0046AC016F
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 12:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DBC7486DF8
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 12:42:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LOOECYoB7zKV for <iommu@lists.linux-foundation.org>;
 Wed, 27 May 2020 12:42:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6EB6E86DF7
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 12:42:45 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4E3DE247; Wed, 27 May 2020 14:42:42 +0200 (CEST)
Date: Wed, 27 May 2020 14:42:40 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v2 0/2] iommu: Remove iommu_sva_ops::mm_exit()
Message-ID: <20200527124240.GK5221@8bytes.org>
References: <20200423125329.782066-1-jean-philippe@linaro.org>
 <20200527101038.GD265288@myrica>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200527101038.GD265288@myrica>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, jgg@ziepe.ca,
 iommu@lists.linux-foundation.org, zhangfei.gao@linaro.org,
 linux-accelerators@lists.ozlabs.org
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

Hi Jean-Philippe,

On Wed, May 27, 2020 at 12:10:38PM +0200, Jean-Philippe Brucker wrote:
> I was wondering if you could take these two patches for v5.8. The API
> change is a precursor for the SVA support in SMMUv3, and the VT-d
> implementation of the SVA API (queued for 5.8) doesn't implement
> iommu_sva_ops.

I'd like some Acks on patch 2 (at least from the Intel people) before
going ahead with this.


Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
