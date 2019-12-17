Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B1486122921
	for <lists.iommu@lfdr.de>; Tue, 17 Dec 2019 11:45:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 15C76204C2;
	Tue, 17 Dec 2019 10:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id obdnPsRBHwc4; Tue, 17 Dec 2019 10:45:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5916620458;
	Tue, 17 Dec 2019 10:45:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 492EEC1D84;
	Tue, 17 Dec 2019 10:45:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DDC1FC077D
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 10:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C4AB285E8C
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 10:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TbtIZ6ChdkTt for <iommu@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 10:45:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CA74E85E6E
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 10:45:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8CDE3B33E;
 Tue, 17 Dec 2019 10:45:37 +0000 (UTC)
Date: Tue, 17 Dec 2019 11:45:35 +0100
From: Joerg Roedel <jroedel@suse.de>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH] iommu: set group default domain before creating direct
 mappings
Message-ID: <20191217104535.GB28651@suse.de>
References: <20191210185606.11329-1-jsnitsel@redhat.com>
 <49bca506-1f6a-ab2d-fac0-302073737af7@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49bca506-1f6a-ab2d-fac0-302073737af7@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

On Wed, Dec 11, 2019 at 08:54:21AM +0800, Lu Baolu wrote:
> On 12/11/19 2:56 AM, Jerry Snitselaar wrote:
> > iommu_group_create_direct_mappings uses group->default_domain, but
> > right after it is called, request_default_domain_for_dev calls
> > iommu_domain_free for the default domain, and sets the group default
> > domain to a different domain. Move the
> > iommu_group_create_direct_mappings call to after the group default
> > domain is set, so the direct mappings get associated with that domain.
> > 
> > Cc: Joerg Roedel <jroedel@suse.de>
> > Cc: Lu Baolu <baolu.lu@linux.intel.com>
> 
> This fix looks good to me.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Applied, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
