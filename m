Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B9041E9A
	for <lists.iommu@lfdr.de>; Wed, 12 Jun 2019 10:05:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8B5FF174B;
	Wed, 12 Jun 2019 08:05:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9ADF61744
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 08:04:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 33D95174
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 08:04:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 6DDA5ABE9;
	Wed, 12 Jun 2019 08:04:28 +0000 (UTC)
Date: Wed, 12 Jun 2019 10:04:26 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH -next v2] iommu/amd: fix a null-ptr-deref in map_sg()
Message-ID: <20190612080426.GL8151@suse.de>
References: <20190506164440.37399-1-cai@lca.pw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506164440.37399-1-cai@lca.pw>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: tmurphy@arista.com, iommu@lists.linux-foundation.org,
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

On Mon, May 06, 2019 at 12:44:40PM -0400, Qian Cai wrote:
> The commit 1a1079011da3 ("iommu/amd: Flush not present cache in
> iommu_map_page") 

That patch was reverted by me in

	97a18f548548a6ee1b9be14c6fc72090b8839875

because it caused issues by testers. So maybe re-submit the above patch
with this fix included?

Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
