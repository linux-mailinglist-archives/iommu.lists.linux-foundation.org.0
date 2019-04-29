Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E73DE4AC
	for <lists.iommu@lfdr.de>; Mon, 29 Apr 2019 16:25:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E589421D1;
	Mon, 29 Apr 2019 14:25:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8234321C5
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:23:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B52F1876
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:23:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 0AD15AF1E;
	Mon, 29 Apr 2019 14:23:28 +0000 (UTC)
Date: Mon, 29 Apr 2019 16:23:26 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Qian Cai <cai@lca.pw>
Subject: Re: "iommu/amd: Set exclusion range correctly" causes smartpqi offline
Message-ID: <20190429142326.GA4678@suse.de>
References: <1556290348.6132.6.camel@lca.pw> <20190426152632.GC3173@suse.de>
	<1556294112.6132.7.camel@lca.pw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556294112.6132.7.camel@lca.pw>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Fri, Apr 26, 2019 at 11:55:12AM -0400, Qian Cai wrote:
> https://git.sr.ht/~cai/linux-debug/blob/master/dmesg

Thanks, I can't see any definitions for unity ranges or exclusion ranges
in the IVRS table dump, which makes it even more weird.

Can you please send me the output of

	for f in `ls -1 /sys/kernel/iommu_groups/*/reserved_regions`; do echo "---$f"; cat $f;done

to double-check?

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
