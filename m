Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4033BA34F7
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 12:30:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6482D5DC1;
	Fri, 30 Aug 2019 10:30:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 780C25D16
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 10:29:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E4B05E6
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 10:29:41 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id B382B1D5; Fri, 30 Aug 2019 12:29:39 +0200 (CEST)
Date: Fri, 30 Aug 2019 12:29:39 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [GIT PULL] iommu/arm-smmu: Big batch of updates for 5.4
Message-ID: <20190830102939.GA29382@8bytes.org>
References: <20190823145440.2b7ejsnglz2bju5k@willie-the-truck>
	<20190828214229.cuqme6acfqxpgvqk@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190828214229.cuqme6acfqxpgvqk@willie-the-truck>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jean-philippe@linaro.org, iommu@lists.linux-foundation.org,
	robin.murphy@arm.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Wed, Aug 28, 2019 at 10:42:30PM +0100, Will Deacon wrote:
> Hi Joerg,
> 
> On Fri, Aug 23, 2019 at 03:54:40PM +0100, Will Deacon wrote:
> > Please pull these ARM SMMU updates for 5.4. The branch is based on the
> > for-joerg/batched-unmap branch that you pulled into iommu/core already
> > because I didn't want to rebase everything onto -rc3. The pull request
> > was generated against iommu/core.
> 
> Just a gentle nudge on this pull request, since it would be nice to have
> it sit in -next for a bit before the merge window opens.
> 
> Please let me know if you need anything more from me.

It is pulled and pushed out now, thanks Will.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
