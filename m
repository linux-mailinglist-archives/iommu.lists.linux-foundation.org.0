Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D94941EFF1
	for <lists.iommu@lfdr.de>; Fri,  1 Oct 2021 16:46:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C77AC401FA;
	Fri,  1 Oct 2021 14:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uQJ8gOOdjbxu; Fri,  1 Oct 2021 14:46:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5D76840130;
	Fri,  1 Oct 2021 14:46:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27D76C000D;
	Fri,  1 Oct 2021 14:46:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01A30C000D
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 14:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB6E341969
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 14:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ejtNmG2crADI for <iommu@lists.linux-foundation.org>;
 Fri,  1 Oct 2021 14:46:23 +0000 (UTC)
X-Greylist: delayed 00:09:09 by SQLgrey-1.8.0
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCAAD40781
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 14:46:23 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HLXkY0sk8z4xb7;
 Sat,  2 Oct 2021 00:37:09 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210930034454.95794-1-aik@ozlabs.ru>
References: <20210930034454.95794-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/iommu: Report the correct most efficient
 DMA mask for PCI devices
Message-Id: <163309900983.1612134.6469972296732099183.b4-ty@ellerman.id.au>
Date: Sat, 02 Oct 2021 00:36:49 +1000
MIME-Version: 1.0
Cc: Carol L Soto <clsoto@us.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>
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

On Thu, 30 Sep 2021 13:44:54 +1000, Alexey Kardashevskiy wrote:
> According to dma-api.rst, the dma_get_required_mask() helper should return
> "the mask that the platform requires to operate efficiently". Which in
> the case of PPC64 means the bypass mask and not a mask from an IOMMU table
> which is shorter and slower to use due to map/unmap operations (especially
> expensive on "pseries").
> 
> However the existing implementation ignores the possibility of bypassing
> and returns the IOMMU table mask on the pseries platform which makes some
> drivers (mpt3sas is one example) choose 32bit DMA even though bypass is
> supported. The powernv platform sort of handles it by having a bigger
> default window with a mask >=40 but it only works as drivers choose
> 63/64bit if the required mask is >32 which is rather pointless.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/iommu: Report the correct most efficient DMA mask for PCI devices
      https://git.kernel.org/powerpc/c/23c216b335d1fbd716076e8263b54a714ea3cf0e

cheers
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
