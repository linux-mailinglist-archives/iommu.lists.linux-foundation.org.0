Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB9917B3F7
	for <lists.iommu@lfdr.de>; Fri,  6 Mar 2020 02:50:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F24DE86962;
	Fri,  6 Mar 2020 01:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ji3VfOzZAnOs; Fri,  6 Mar 2020 01:50:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0DB9486457;
	Fri,  6 Mar 2020 01:50:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9BBAC18DA;
	Fri,  6 Mar 2020 01:50:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40D6FC013E
 for <iommu@lists.linux-foundation.org>; Fri,  6 Mar 2020 01:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2A0F387475
 for <iommu@lists.linux-foundation.org>; Fri,  6 Mar 2020 01:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rFoaqtAdjEcJ for <iommu@lists.linux-foundation.org>;
 Fri,  6 Mar 2020 01:50:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5F24382D5F
 for <iommu@lists.linux-foundation.org>; Fri,  6 Mar 2020 01:50:40 +0000 (UTC)
Received: from gwarestrin.me.apana.org.au ([192.168.0.7]
 helo=gwarestrin.arnor.me.apana.org.au)
 by fornost.hmeau.com with smtp (Exim 4.89 #2 (Debian))
 id 1jA27S-0005nc-W2; Fri, 06 Mar 2020 12:49:44 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 06 Mar 2020 12:49:42 +1100
Date: Fri, 6 Mar 2020 12:49:42 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v2] MAINTAINERS: add maintainers for uacce
Message-ID: <20200306014942.GG30653@gondor.apana.org.au>
References: <1582680508-596-1-git-send-email-zhangfei.gao@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582680508-596-1-git-send-email-zhangfei.gao@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jean-philippe <jean-philippe@linaro.org>, dave.jiang@intel.com,
 kenneth-lee-2012@foxmail.com, Arnd Bergmann <arnd@arndb.de>,
 francois.ozog@linaro.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 ilias.apalodimas@linaro.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>,
 grant.likely@arm.com, "haojian . zhuang" <haojian.zhuang@linaro.org>,
 linux-accelerators@lists.ozlabs.org, guodong.xu@linaro.org,
 linux-crypto@vger.kernel.org
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

On Wed, Feb 26, 2020 at 09:28:28AM +0800, Zhangfei Gao wrote:
> Add Zhangfei Gao and Zhou Wang as maintainers for uacce
> 
> Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
> ---
> Add list, suggested by Dave
> 
> MAINTAINERS | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
