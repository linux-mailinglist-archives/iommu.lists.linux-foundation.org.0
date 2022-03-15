Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4664DA064
	for <lists.iommu@lfdr.de>; Tue, 15 Mar 2022 17:48:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17A9881319;
	Tue, 15 Mar 2022 16:48:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RvRd8F3EXSX3; Tue, 15 Mar 2022 16:48:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CC04481260;
	Tue, 15 Mar 2022 16:48:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C6C9C0033;
	Tue, 15 Mar 2022 16:48:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3F61C000B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Mar 2022 16:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8043F61070
 for <iommu@lists.linux-foundation.org>; Tue, 15 Mar 2022 16:48:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O6C3Z6BpCye5 for <iommu@lists.linux-foundation.org>;
 Tue, 15 Mar 2022 16:48:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BDD861006
 for <iommu@lists.linux-foundation.org>; Tue, 15 Mar 2022 16:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NQX8+5nySoNC5mbdZyl6P/Zb6lIGsr4OoSrqjyhxvFw=; b=WN66xSNv72R+8NnaTfLzcrmyQO
 dAwotE14FKTGCz/uOjsYeQmg2LKaBIoVUXeWVAM2noGxnlHiSuHfR0AB+gAfHd8nvl5en038lksxF
 LXDGlF+pcQOtLVtep0t4W1tJdCRVyJNjxqB2ZPg3QUaoTdV8BP/8J/BT3EPRVq72S54CpJHCS3Zel
 0/fYGYJstPcOzvmVcJ6zVZLne91GPKNaxPSDDkJsbAnyPY3mOKuvGwFm/0fIHBYXK0AIevXhzU8Tq
 W2Icp+694MKqfFnuq6/yIXQdG1pd+bAX50OTj/1Zls1rWu4NoKzA+lPw4kQE1+Npdcv89+oMiPxrg
 GpWZr+/A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nUALJ-009vSs-AR; Tue, 15 Mar 2022 16:48:17 +0000
Date: Tue, 15 Mar 2022 09:48:17 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 2/2] thunderbolt: Use pre-boot DMA protection on AMD
 systems
Message-ID: <YjDDUUeZ/dvUZoDN@infradead.org>
References: <20220315162455.5190-1-mario.limonciello@amd.com>
 <20220315162455.5190-2-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220315162455.5190-2-mario.limonciello@amd.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Michael Jamet <michael.jamet@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:AMD IOMMU \(AMD-VI\)" <iommu@lists.linux-foundation.org>,
 Andreas Noever <andreas.noever@gmail.com>, Will Deacon <will@kernel.org>
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

On Tue, Mar 15, 2022 at 11:24:55AM -0500, Mario Limonciello wrote:
> -	 * handled natively using IOMMU. It is enabled when IOMMU is
> -	 * enabled and ACPI DMAR table has DMAR_PLATFORM_OPT_IN set.
> +	 * handled natively using IOMMU. It is enabled when the IOMMU is
> +	 * enabled and either:
> +	 * ACPI DMAR table has DMAR_PLATFORM_OPT_IN set
> +	 * or
> +	 * ACPI IVRS table has DMA_REMAP bitset
>  	 */
>  	return sprintf(buf, "%d\n",
> -		       iommu_present(&pci_bus_type) && dmar_platform_optin());
> +		       iommu_present(&pci_bus_type) &&
> +		       (dmar_platform_optin() || amd_ivrs_remap_support()));

Yikes.  No, the thunderbot code does not have any business poking into
either dmar_platform_optin or amd_ivrs_remap_support.  This needs
a proper abstration from the IOMMU code.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
