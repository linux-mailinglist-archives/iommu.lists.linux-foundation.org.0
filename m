Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 683F1255DE0
	for <lists.iommu@lfdr.de>; Fri, 28 Aug 2020 17:29:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1B99387C0A;
	Fri, 28 Aug 2020 15:29:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8PS0D7NcEMrO; Fri, 28 Aug 2020 15:29:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7892A85B8D;
	Fri, 28 Aug 2020 15:29:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C240C0891;
	Fri, 28 Aug 2020 15:29:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D276C0051
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 15:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3BAFB20349
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 15:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X41W879RtTqH for <iommu@lists.linux-foundation.org>;
 Fri, 28 Aug 2020 15:29:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 3D88420109
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 15:29:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A88D0AEA5;
 Fri, 28 Aug 2020 15:30:17 +0000 (UTC)
Date: Fri, 28 Aug 2020 17:29:43 +0200
From: "jroedel@suse.de" <jroedel@suse.de>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 0/2] iommu/amd: Fix IOMMUv2 devices when SME is active
Message-ID: <20200828152943.GY3354@suse.de>
References: <20200824105415.21000-1-joro@8bytes.org>
 <MN2PR12MB4488D6B7BBF98845DF796E0BF7540@MN2PR12MB4488.namprd12.prod.outlook.com>
 <34db343f-cd23-09af-3bc5-29b9d385f85d@amd.com>
 <MN2PR12MB4488BF7DDE700378F7B2776CF7540@MN2PR12MB4488.namprd12.prod.outlook.com>
 <20200828134639.GW3354@suse.de>
 <60067932-dbf4-d67b-cf11-4dd2b016ed63@amd.com>
 <MN2PR12MB448849D3AD019749DB64A146F7520@MN2PR12MB4488.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MN2PR12MB448849D3AD019749DB64A146F7520@MN2PR12MB4488.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Huang,
 Ray" <Ray.Huang@amd.com>
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

On Fri, Aug 28, 2020 at 03:11:32PM +0000, Deucher, Alexander wrote:
> There are hw bugs on Raven and probably Carrizo/Stoney where they need
> 1:1 mapping to avoid bugs in some corner cases with the displays.
> Other GPUs should be fine.  The VIDs is 0x1002 and the DIDs are 0x15dd
> and 0x15d8 for raven variants and 0x9870, 0x9874, 0x9875, 0x9876,
> 0x9877 and 0x98e4 for carrizo and stoney.  As long as we
> preserve the 1:1 mapping for those asics, we should be fine.

Okay, Stoney at least has no Zen-based CPU, so no support for memory
encryption anyway. How about Raven, is it paired with a Zen CPU?

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
