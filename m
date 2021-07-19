Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 192F63CD013
	for <lists.iommu@lfdr.de>; Mon, 19 Jul 2021 11:08:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC394605B7;
	Mon, 19 Jul 2021 09:08:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4-CYX_ItU1bu; Mon, 19 Jul 2021 09:08:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E16386079C;
	Mon, 19 Jul 2021 09:08:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8C3FC000E;
	Mon, 19 Jul 2021 09:08:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BC09C000E
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 09:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2F5C8308B
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 09:07:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5T5ezjzpGs9V for <iommu@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 09:07:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F61683083
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 09:07:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE1BA600CD;
 Mon, 19 Jul 2021 09:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626685679;
 bh=od5XSDQTfWU6h3EBK31swNvCr2oAj09MRWLUd2Bmnk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jtQXNI4SmLk8EtT5ECK7dKulrmM27pE6h63WGyxaR8Zhvmv3AptHX4KRl98JRmYhe
 HXR3DKCvblTMrhg+ZmnL+GmB2q3l9rrTWyjz4E5Cm5HZngF7KQJp1EiYwTguPwAB/j
 koLO92gxFUnUzu26HblHWuQOSG5oQu2t0LrrTS5NLTLZuIWZel2X9pOLkH57LHxGRx
 LWv4Yy3Ke3k/6jk2tuUbzqlvudtBqSMgd6W0wUZh3EK23eC3jmAyV2O6ZXDA9eLL6F
 MJrVkaLMT98XhmlWbWORhGQxvay7vs+ybFoyINZRkQ14E6eneZ/X/1olMf+HUdCNTE
 LtJqIr02RyIHw==
Date: Mon, 19 Jul 2021 10:07:54 +0100
From: Will Deacon <will@kernel.org>
To: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Subject: Re: [PATCH] iommu/amd: Convert from atomic_t to refcount_t on
 device_state->count
Message-ID: <20210719090754.GB6221@willie-the-truck>
References: <1626674437-56007-1-git-send-email-xiyuyang19@fudan.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1626674437-56007-1-git-send-email-xiyuyang19@fudan.edu.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
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

On Mon, Jul 19, 2021 at 02:00:37PM +0800, Xiyu Yang wrote:
> refcount_t type and corresponding API can protect refcounters from
> accidental underflow and overflow and further use-after-free situations.
> 
> Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
> ---
>  drivers/iommu/amd/iommu_v2.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Can pasid_state::count be converted similarly?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
