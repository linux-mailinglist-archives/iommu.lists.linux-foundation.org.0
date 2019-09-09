Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2986BAD433
	for <lists.iommu@lfdr.de>; Mon,  9 Sep 2019 09:54:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1EBCFD9D;
	Mon,  9 Sep 2019 07:54:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 000A7D49
	for <iommu@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 07:54:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AD7527DB
	for <iommu@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 07:54:13 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
	by fornost.hmeau.com with smtp (Exim 4.89 #2 (Debian))
	id 1i7EUn-0007dH-9C; Mon, 09 Sep 2019 17:53:58 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
	Mon, 09 Sep 2019 17:53:50 +1000
Date: Mon, 9 Sep 2019 17:53:50 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: zhong jiang <zhongjiang@huawei.com>
Subject: Re: [PATCH 1/3] crypto: marvell: Use kzfree rather than its
	implementation
Message-ID: <20190909075349.GD21364@gondor.apana.org.au>
References: <1567566079-7412-1-git-send-email-zhongjiang@huawei.com>
	<1567566079-7412-2-git-send-email-zhongjiang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1567566079-7412-2-git-send-email-zhongjiang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS
	autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: gregkh@linuxfoundation.org, arno@natisbad.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
	davem@davemloft.net
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

On Wed, Sep 04, 2019 at 11:01:17AM +0800, zhong jiang wrote:
> Use kzfree instead of memset() + kfree().
> 
> Signed-off-by: zhong jiang <zhongjiang@huawei.com>
> ---
>  drivers/crypto/marvell/hash.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
