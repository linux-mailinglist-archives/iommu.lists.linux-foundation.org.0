Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB671EB589
	for <lists.iommu@lfdr.de>; Tue,  2 Jun 2020 07:56:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3F1D085F7B;
	Tue,  2 Jun 2020 05:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id alZSFWaKUXrU; Tue,  2 Jun 2020 05:56:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5016785E69;
	Tue,  2 Jun 2020 05:56:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43BEFC0176;
	Tue,  2 Jun 2020 05:56:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FFA8C0176
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 05:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1620386937
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 05:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uj2PV1zk4hyn for <iommu@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 05:56:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1CEB686914
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 05:56:44 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R941e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e07425;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0U-LpR9d_1591077399; 
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0U-LpR9d_1591077399) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 02 Jun 2020 13:56:40 +0800
Date: Tue, 2 Jun 2020 13:56:39 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: iommu: Improve exception handling in iommu_group_alloc()
Message-ID: <20200602055639.GB89266@VM20190228-100.tbsite.net>
References: <9f8d8308-2056-8e33-7b38-0b7d96e51c3c@web.de>
 <20200602015044.GA89266@VM20190228-100.tbsite.net>
 <b31fbcd1-b5f8-992b-a994-2a950ab36b61@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b31fbcd1-b5f8-992b-a994-2a950ab36b61@web.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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
Reply-To: Baolin Wang <baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Jun 02, 2020 at 07:01:02AM +0200, Markus Elfring wrote:
> >> * I suggest to avoid the specification of duplicate function calls.
> >>   Will it be helpful to add a few jump targets?
> >>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162#n455
> >
> > I don't think it is helpful or readable to add some jump targets here,
> > since the exception handling is very simple here.
> 
> Do you disagree to the application of the Linux coding style then
> for the recommended exception handling?

No, that's not what I mean. My point is the exception handling in this
patch is simple and no need to add 'goto' statement which does not help
to improve readability. And I agree it is helpful for the cases where a
function exits from multiple locations and more same cleanup work need
to do.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
