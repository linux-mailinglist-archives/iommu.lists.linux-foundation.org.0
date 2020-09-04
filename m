Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D085B25D571
	for <lists.iommu@lfdr.de>; Fri,  4 Sep 2020 11:53:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 752F987516;
	Fri,  4 Sep 2020 09:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uCvUE0aJWQZU; Fri,  4 Sep 2020 09:53:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 22EA2874F6;
	Fri,  4 Sep 2020 09:53:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 101EBC0051;
	Fri,  4 Sep 2020 09:53:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 553AEC0051
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4324686D1F
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:53:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O0NUHViyOx2c for <iommu@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 09:53:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B082086D1C
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:53:56 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6962C9CE; Fri,  4 Sep 2020 11:53:54 +0200 (CEST)
Date: Fri, 4 Sep 2020 11:53:53 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH 0/2 v2] iommu: amd: Fix intremap IO_PAGE_FAULT for VMs
Message-ID: <20200904095352.GR6714@8bytes.org>
References: <20200903093822.52012-1-suravee.suthikulpanit@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903093822.52012-1-suravee.suthikulpanit@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jon.grimm@amd.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, james.puthukattukaran@oracle.com,
 boris.ostrovsky@oracle.com, joao.m.martins@oracle.com,
 sean.m.osborne@oracle.com
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

On Thu, Sep 03, 2020 at 09:38:20AM +0000, Suravee Suthikulpanit wrote:
> Suravee Suthikulpanit (2):
>   iommu: amd: Restore IRTE.RemapEn bit after programming IRTE
>   iommu: amd: Use cmpxchg_double() when updating 128-bit IRTE

Applied both for v5.9, thanks Suravee.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
