Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BA987519A19
	for <lists.iommu@lfdr.de>; Wed,  4 May 2022 10:42:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53F51813AF;
	Wed,  4 May 2022 08:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HJgQ9vLro2Ti; Wed,  4 May 2022 08:42:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 88D91813A8;
	Wed,  4 May 2022 08:42:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 646C5C007E;
	Wed,  4 May 2022 08:42:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B920CC0032
 for <iommu@lists.linux-foundation.org>; Wed,  4 May 2022 08:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF49C4010C
 for <iommu@lists.linux-foundation.org>; Wed,  4 May 2022 08:42:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LA6GgrSI-mMa for <iommu@lists.linux-foundation.org>;
 Wed,  4 May 2022 08:42:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2A3F400F2
 for <iommu@lists.linux-foundation.org>; Wed,  4 May 2022 08:42:11 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 15359477; Wed,  4 May 2022 10:42:09 +0200 (CEST)
Date: Wed, 4 May 2022 10:42:07 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Qian Cai <quic_qiancai@quicinc.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RESEND PATCH v8 00/11] Fix BUG_ON in vfio_iommu_group_notifier()
Message-ID: <YnI8Xy54M3XQpS0T@8bytes.org>
References: <20220418005000.897664-1-baolu.lu@linux.intel.com>
 <20220502161204.GA22@qian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220502161204.GA22@qian>
Cc: Kevin Tian <kevin.tian@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Jason Gunthorpe <jgg@nvidia.com>
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

On Mon, May 02, 2022 at 12:12:04PM -0400, Qian Cai wrote:
> Reverting this series fixed an user-after-free while doing SR-IOV.
> 
>  BUG: KASAN: use-after-free in __lock_acquire

Hrm, okay. I am going exclude this series from my next branch for now
until this has been sorted out.

Alex, I suggest you do the same.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
