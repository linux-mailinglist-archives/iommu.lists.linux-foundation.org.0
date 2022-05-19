Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6AD52CD18
	for <lists.iommu@lfdr.de>; Thu, 19 May 2022 09:32:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52F4960BD1;
	Thu, 19 May 2022 07:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3q-jv5kDt2Eq; Thu, 19 May 2022 07:32:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 66B7F60BC8;
	Thu, 19 May 2022 07:32:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 331E6C007E;
	Thu, 19 May 2022 07:32:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E33C0C002D
 for <iommu@lists.linux-foundation.org>; Thu, 19 May 2022 07:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C363E84366
 for <iommu@lists.linux-foundation.org>; Thu, 19 May 2022 07:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="RiqKOlV/";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="votpWPP3"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJ_6B5SLBipt for <iommu@lists.linux-foundation.org>;
 Thu, 19 May 2022 07:32:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B76F8430E
 for <iommu@lists.linux-foundation.org>; Thu, 19 May 2022 07:32:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8556D21C11;
 Thu, 19 May 2022 07:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652945527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1NriRJUGL9rN+ExQy9z1nZpmtIjuh7HQeqGeS/7dLvQ=;
 b=RiqKOlV/LAZPPa32jERemk2UmIWyJbkYwF6MTJhgBK5czperbb6Jhnsu4ZuQ7nOoU9XuL/
 5e/zqTkNkX6H/Dx9VPkEkGD8cqyp2A6m29SNR0Sg9ZUDN69Py1gXPN9AKG1yESNllZQOaB
 EEbQvDbfDpI3ewM8OZQvY48oT4NoNc4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652945527;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1NriRJUGL9rN+ExQy9z1nZpmtIjuh7HQeqGeS/7dLvQ=;
 b=votpWPP3mkVwF07x+QKGObxmydIBXp6/+aIZtu0et2rZQQEeJzb8RLmWvWNTIKCbXvhlmm
 m67avEH0a/5z1xBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A4E213B1E;
 Thu, 19 May 2022 07:32:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nXLbBHfyhWL8HgAAMHmgww
 (envelope-from <jroedel@suse.de>); Thu, 19 May 2022 07:32:07 +0000
Date: Thu, 19 May 2022 09:32:05 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3] iommu: iommu_group_claim_dma_owner() must always
 assign a domain
Message-ID: <YoXydUP7TCb2YmOW@suse.de>
References: <0-v3-db7f0785022b+149-iommu_dma_block_jgg@nvidia.com>
 <183e155eae268c32e7d02f68846250702fe99065.camel@linux.ibm.com>
 <20220518191446.GU1343366@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220518191446.GU1343366@nvidia.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Qian Cai <quic_qiancai@quicinc.com>, Eric Farman <farman@linux.ibm.com>,
 iommu@lists.linux-foundation.org, Alex Williamson <alex.williamson@redhat.com>,
 Will Deacon <will@kernel.org>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, May 18, 2022 at 04:14:46PM -0300, Jason Gunthorpe wrote:
> Fixes: 0286300e6045 ("iommu: iommu_group_claim_dma_owner() must always as=
sign a domain")
> Reported-by: Eric Farman <farman@linux.ibm.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/vfio.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

That fix will be taken care of by Alex? Or does it need to go through
the IOMMU tree?

Regards,

-- =

J=F6rg R=F6del
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Maxfeldstr. 5
90409 N=FCrnberg
Germany
 =

(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Ivo Totev

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
