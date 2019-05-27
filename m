Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5552B740
	for <lists.iommu@lfdr.de>; Mon, 27 May 2019 16:06:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D33991858;
	Mon, 27 May 2019 14:05:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A06D81834
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 14:05:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3A69213A
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 14:05:21 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 6FB302E2; Mon, 27 May 2019 16:05:19 +0200 (CEST)
Date: Mon, 27 May 2019 16:05:15 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lukasz Odzioba <lukasz.odzioba@intel.com>
Subject: Re: [PATCH 1/1] iommu/vt-d: Remove unnecessary rcu_read_locks
Message-ID: <20190527140514.GE8420@8bytes.org>
References: <1558359688-21804-1-git-send-email-lukasz.odzioba@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558359688-21804-1-git-send-email-lukasz.odzioba@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
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

On Mon, May 20, 2019 at 03:41:28PM +0200, Lukasz Odzioba wrote:
> We use RCU's for rarely updated lists like iommus, rmrr, atsr units.
> 
> I'm not sure why domain_remove_dev_info() in domain_exit() was surrounded
> by rcu_read_lock. Lock was present before refactoring in d160aca527,
> but it was related to rcu list, not domain_remove_dev_info function.
> 
> dmar_remove_one_dev_info() doesn't touch any of those lists, so it doesn't
> require a lock. In fact it is called 6 times without it anyway.
> 
> Fixes: d160aca5276d ("iommu/vt-d: Unify domain->iommu attach/detachment")
> 
> Signed-off-by: Lukasz Odzioba <lukasz.odzioba@intel.com>

Applied, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
