Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A222CADF6
	for <lists.iommu@lfdr.de>; Tue,  1 Dec 2020 22:02:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2DD3E881C6;
	Tue,  1 Dec 2020 21:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRturG9S1bBc; Tue,  1 Dec 2020 21:02:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AD608881C4;
	Tue,  1 Dec 2020 21:02:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97B1CC0052;
	Tue,  1 Dec 2020 21:02:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29B6BC0052
 for <iommu@lists.linux-foundation.org>; Tue,  1 Dec 2020 21:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 488C12E1BA
 for <iommu@lists.linux-foundation.org>; Tue,  1 Dec 2020 21:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UKLtwlvtRN0N for <iommu@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 21:02:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 12BA42E1B4
 for <iommu@lists.linux-foundation.org>; Tue,  1 Dec 2020 21:02:20 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D013F204FD;
 Tue,  1 Dec 2020 21:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606856540;
 bh=tv0qvp7to0qfEmCOChYQQOvDzhMCYnFg7qz3e7fOdT0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XhNyyCxvF53jfvtVVkEPIb7sTB4ys0hgtVFYv4gVM0CBA1gr4VjEkpcULK2p9lc34
 cRFa/tyjdaKG9ghzutUzoWmu0p6jwvlLOc9PPfg4kCaScEQ59f1vExhWBceGqivoe1
 IxM4ZA2Eiz8DO0IfMlkQCo9gQlHjnYJmmkDN1Fu8=
Date: Tue, 1 Dec 2020 21:02:15 +0000
From: Will Deacon <will@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [RESEND PATCH v3 0/4] iommu/iova: Solve longterm IOVA issue
Message-ID: <20201201210215.GB28178@willie-the-truck>
References: <1605608734-84416-1-git-send-email-john.garry@huawei.com>
 <d87ceec4-b7a1-c600-3b78-6852f0320ce2@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d87ceec4-b7a1-c600-3b78-6852f0320ce2@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linuxarm@huawei.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, xiyou.wangcong@gmail.com,
 robin.murphy@arm.com
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

On Tue, Dec 01, 2020 at 03:35:02PM +0000, John Garry wrote:
> On 17/11/2020 10:25, John Garry wrote:
> Is there any chance that we can get these picked up for 5.11? We've seen
> this issue solved here for a long time.
> 
> Or, @Robin, let me know if not happy with this since v1.
> 
> BTW, patch #4 has been on the go for ~1 year now, and is a nice small
> optimisation from Cong, which I picked up and already had a RB tag.

I can pick the last patch up, but I'd really like some reviewed/tested-bys
on the others.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
