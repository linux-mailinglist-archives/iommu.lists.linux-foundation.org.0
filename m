Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BE17D276CF8
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 11:23:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6ECB7874E4;
	Thu, 24 Sep 2020 09:23:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id heRFMJwz2mXI; Thu, 24 Sep 2020 09:23:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F0940874E1;
	Thu, 24 Sep 2020 09:23:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4BDAC0051;
	Thu, 24 Sep 2020 09:23:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95887C0051
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 09:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8213D2E0D8
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 09:23:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qS6gQ8+vKUyO for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 09:23:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id B27382045D
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 09:23:51 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 25EE7401; Thu, 24 Sep 2020 11:23:50 +0200 (CEST)
Date: Thu, 24 Sep 2020 11:23:48 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jerry Snitselaar <jsnitsel@redhat.com>
Subject: Re: kdump boot failing with IVRS checksum failure
Message-ID: <20200924092348.GI27174@8bytes.org>
References: <87o8lzvtzp.fsf@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o8lzvtzp.fsf@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

Hi Jerry,

On Mon, Sep 21, 2020 at 11:56:42AM -0700, Jerry Snitselaar wrote:
> We are seeing a kdump kernel boot failure in test on an HP DL325 Gen10
> and it was tracked down to 387caf0b759a ("iommu/amd: Treat per-device
> exclusion ranges as r/w unity-mapped regions"). Reproduced on 5.9-rc5
> and goes away with revert of the commit. There is a follow on commit
> that depends on this that was reverted as well 2ca6b6dc8512 ("iommu/amd:
> Remove unused variable"). I'm working on getting system access and want
> to see what the IVRS table looks like, but thought I'd give you heads
> up.

Thanks for looking into this, we really need to find the root-cause to
avoid the revert.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
